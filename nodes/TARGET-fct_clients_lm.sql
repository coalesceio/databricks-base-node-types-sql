@id("979134b4-13e0-4fe6-9ba1-76f88900c584")
@nodeType("SQLFact")
@description("mergeStrategy lastModified - SCD Type 1 on update_time")
@mergeStrategy("lastModified")
SELECT
    `client_id`                          AS `client_id`          @id("237274") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("389f7b"),
    `email`                              AS `email`              @id("25ddf0"),
    `region`                             AS `region`             @id("295849"),
    `update_time`                        AS `update_time`        @id("d12ea1") @lastModifiedTracking,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("5c2ae1") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("e1241e") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
