@id("17dcbc18-775b-45c3-9547-2b6d660bb1b8")
@nodeType("SQLFact")
@description("mergeStrategy upsert - matched rows updated, new rows inserted, no change detection")
@mergeStrategy("upsert")
SELECT
    `client_id`                          AS `client_id`          @id("6668fe") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("a0d43a"),
    `email`                              AS `email`              @id("bb7bf2"),
    `region`                             AS `region`             @id("81b4bc"),
    `update_time`                        AS `update_time`        @id("35a356"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("8557d8") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("c888d8") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
