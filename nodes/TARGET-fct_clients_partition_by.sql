@id("358be073-a497-4551-be24-4e7d0236c469")
@nodeType("SQLFact")
@description("Column-level partitionBy - table partitioned by region")
@mergeStrategy("changeTracking")
SELECT
    `client_id`                          AS `client_id`          @id("869dab") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("9d7140"),
    `email`                              AS `email`              @id("449c38"),
    `region`                             AS `region`             @id("c7a92c") @partitionBy,
    `update_time`                        AS `update_time`        @id("291c6c"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("102cf2") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("478aea") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
