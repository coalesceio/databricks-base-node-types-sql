@id("e7832ae6-9c96-46ce-b73c-7c841ed40450")
@nodeType("SQLFact")
@description("Business key with no mergeStrategy annotation - defaults to changeTracking SCD Type 1")
SELECT
    `client_id`                          AS `client_id`          @id("faa6d6") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("3513f5"),
    `email`                              AS `email`              @id("85f4bc"),
    `region`                             AS `region`             @id("5c9d59"),
    `update_time`                        AS `update_time`        @id("7339a9"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("1d1296") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("95550b") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
