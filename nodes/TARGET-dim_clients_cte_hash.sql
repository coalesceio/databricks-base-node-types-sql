@id("13e191fc-bdf7-4bcb-b9ae-ced4adb5c3a6")
@nodeType("733")
@description("SCD1 dimension - CTE de-duplicating the source to one row per client, plus a SHA256 hash column")
@mergeStrategy("changeTracking")
WITH `LATEST_CLIENTS` AS (
    SELECT *
    FROM {{ ref('SRC', 'clients') }}
    QUALIFY ROW_NUMBER() OVER (PARTITION BY `client_id` ORDER BY `update_time` DESC) = 1
)
SELECT
    CAST(0 AS BIGINT)                                       AS `dim_clients_cte_hash_KEY` @id("8250b5") @isSurrogateKey,
    `client_id`                                             AS `client_id`                @id("3f6b9e") @isBusinessKey @inHash("CLIENT_HASH", 1),
    `client_name`                                           AS `client_name`              @id("9e236f") @inHash("CLIENT_HASH", 2),
    `email`                                                 AS `email`                    @id("c7af88") @inHash("CLIENT_HASH", 3),
    `update_time`                                           AS `update_time`              @id("8c59eb"),
    CAST({{ get_hash('CLIENT_HASH', 'SHA256') }} AS STRING) AS `CLIENT_HASH`              @id("b37fdc"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                    AS `SYSTEM_CREATE_DATE`       @id("cbd8a3") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                    AS `SYSTEM_UPDATE_DATE`       @id("0eba99") @isSystemUpdateDate
FROM `LATEST_CLIENTS` `clients`