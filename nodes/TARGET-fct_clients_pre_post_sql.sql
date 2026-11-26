@id("bc423f37-0bd9-4671-bcf0-2ac5b51638e3")
@nodeType("SQLFact")
@description("preSQL / postSQL - two pre-load statements and one post-load statement")
@mergeStrategy("changeTracking")
@preSQL("SELECT 1")
@preSQL("SELECT CURRENT_TIMESTAMP() AS `LOAD_START`")
@postSQL("SELECT COUNT(*) AS `ROW_COUNT` FROM {{ this }}")
SELECT
    `client_id`                          AS `client_id`          @id("07d9af") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("2a7016"),
    `email`                              AS `email`              @id("b0e8b0"),
    `region`                             AS `region`             @id("129cb9"),
    `update_time`                        AS `update_time`        @id("b682b0"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("4e0ff7") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("15afda") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
