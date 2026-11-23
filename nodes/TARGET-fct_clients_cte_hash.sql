@id("65ee8eee-3e64-4941-9e19-273b162b3e37")
@nodeType("734")
@description("Fact - CTE keeping the latest row per client, SHA256 hash column, change tracking")
@mergeStrategy("changeTracking")
WITH `LATEST_CLIENTS` AS (
    SELECT *
    FROM {{ ref('SRC', 'clients') }}
    QUALIFY ROW_NUMBER() OVER (PARTITION BY `client_id` ORDER BY `update_time` DESC) = 1
)
SELECT
    `client_id`                                          AS `client_id`          @id("2b790e") @isBusinessKey @inHash("ROW_HASH", 1),
    `client_name`                                        AS `client_name`        @id("69d37c") @inHash("ROW_HASH", 2),
    `email`                                              AS `email`              @id("aa4697") @inHash("ROW_HASH", 3),
    `region`                                             AS `region`             @id("70e07b"),
    `update_time`                                        AS `update_time`        @id("3f3a46") @freshness(30, "DAY"),
    CAST({{ get_hash('ROW_HASH', 'SHA256') }} AS STRING) AS `ROW_HASH`           @id("3ab803") @not_null,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                 AS `SYSTEM_CREATE_DATE` @id("a85131") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                 AS `SYSTEM_UPDATE_DATE` @id("da8396") @isSystemUpdateDate
FROM `LATEST_CLIENTS` `clients`