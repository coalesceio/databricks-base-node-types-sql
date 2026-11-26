@id("5bef1345-e58a-475e-b412-44e27935862a")
@nodeType("SQLFact")
@description("materializationType table (explicit)")
@materializationType("table")
@mergeStrategy("changeTracking")
SELECT
    `client_id`                          AS `client_id`          @id("132c28") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("613fc6"),
    `email`                              AS `email`              @id("442d20"),
    `region`                             AS `region`             @id("cc89a6"),
    `update_time`                        AS `update_time`        @id("e2dec9"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("95e895") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("140c92") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
