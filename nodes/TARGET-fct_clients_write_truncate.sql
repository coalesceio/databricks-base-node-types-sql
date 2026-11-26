@id("cd7ea66f-3322-4224-a052-f42602d93539")
@nodeType("SQLFact")
@description("writeMode truncateInsert - table truncated, then merged (every row reloaded as new)")
@mergeStrategy("changeTracking")
@writeMode("truncateInsert")
SELECT
    `client_id`                          AS `client_id`          @id("08b34f") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("2489c2"),
    `email`                              AS `email`              @id("520478"),
    `region`                             AS `region`             @id("cdf6c3"),
    `update_time`                        AS `update_time`        @id("428cb2"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("d3713c") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("40155a") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
