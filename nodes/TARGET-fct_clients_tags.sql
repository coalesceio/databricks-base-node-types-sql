@id("afaa2c1e-a0aa-410a-870f-cdd0434ed436")
@nodeType("SQLFact")
@description("tag - node-level tags on the table and a column-level tag on email")
@mergeStrategy("changeTracking")
@tag("cost_center", "finance")
@tag("env", "dev")
SELECT
    `client_id`                          AS `client_id`          @id("76badf") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("a26e92"),
    `email`                              AS `email`              @id("355062") @tag("pii", "email"),
    `region`                             AS `region`             @id("465684"),
    `update_time`                        AS `update_time`        @id("787e7f"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("7718b3") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("fd288b") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
