@id("9f33e52d-86dd-48eb-88b5-86325dbd5c3a")
@nodeType("734")
@description("Fact - upsert with truncateInsert write mode and pre-SQL / post-SQL")
@mergeStrategy("upsert")
@writeMode("truncateInsert")
@preSQL("SELECT 1")
@postSQL("SELECT COUNT(*) AS `ROW_COUNT` FROM {{ this }}")
SELECT
    `client_id`                                                 AS `client_id`          @id("e7b6ba") @isBusinessKey @primaryKey(1),
    CAST(UPPER(`client_name`) AS VARCHAR(20))                   AS `client_name`          @id("855f94"),
    `region`                                                    AS `region`             @id("9cc351"),
    `update_time`                                               AS `update_time`        @id("9ab872"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                        AS `SYSTEM_UPDATE_DATE` @id("ec8173") @isSystemUpdateDate
FROM {{ ref('SRC', 'clients') }} `clients`