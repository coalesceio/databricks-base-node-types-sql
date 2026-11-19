@id("aaf920ab-f0c0-4b1f-b1c4-0ef891fd5739")
@nodeType("733")
@description("Upsert dimension - matched rows updated, new rows inserted")
@mergeStrategy("upsert")
@preSQL("SELECT 1")
@postSQL("SELECT 1")
SELECT
    `client_id`                          AS `client_id`          @id("f3ca9c") @isBusinessKey @primaryKey(1),
    UPPER(`client_name`)                 AS `client_name`        @id("bdfb4d") @description("Upper-cased client name"),
    `email`                              AS `email`              @id("df67e6"),
    `region`                             AS `region`             @id("759eba"),
    `update_time`                        AS `update_time`        @id("11fd40"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("31a359") @isSystemUpdateDate
FROM {{ ref('SRC', 'clients') }} `clients`