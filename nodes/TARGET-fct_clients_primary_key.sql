@id("41b66162-a80e-4011-a47b-53ece830b906")
@nodeType("SQLFact")
@description("primaryKey - informational PRIMARY KEY on client_id, paired with not_null and uniqueness tests")
@mergeStrategy("changeTracking")
SELECT
    `client_id`                          AS `client_id`          @id("b7e8a7") @isBusinessKey @primaryKey(1) @not_null @uniqueness,
    `client_name`                        AS `client_name`        @id("73bc20"),
    `email`                              AS `email`              @id("60abab"),
    `region`                             AS `region`             @id("16dbb2"),
    `update_time`                        AS `update_time`        @id("091beb"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("9123fe") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("056a4b") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
