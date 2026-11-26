@id("c1c7f9d0-86f4-4f12-9df2-f910469bac8c")
@nodeType("SQLFact")
@description("mergeStrategy changeTracking - SCD Type 1, every attribute column compared")
@mergeStrategy("changeTracking")
SELECT
    `client_id`                          AS `client_id`          @id("775fba") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("629959"),
    `email`                              AS `email`              @id("c1a256"),
    `region`                             AS `region`             @id("b56586"),
    `update_time`                        AS `update_time`        @id("1894ba"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("17987d") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("67dfe7") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
