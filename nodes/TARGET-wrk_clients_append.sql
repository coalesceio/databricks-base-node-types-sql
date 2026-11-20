@id("f78f4f8c-e94f-41db-b6f3-1767776cdf5a")
@nodeType("708")
@description("Work table - append write mode with pre-SQL / post-SQL")
@writeMode("append")
@preSQL("DELETE FROM {{ this }} WHERE `LOAD_DATE` < DATE_SUB(CURRENT_DATE(), 30)")
@postSQL("SELECT COUNT(*) AS `ROW_COUNT` FROM {{ this }}")
SELECT
    `client_id`    AS `client_id`   @id("cc2e44") @not_null,
    `client_name`  AS `client_name` @id("f267dc"),
    `email`        AS `email`       @id("eeb858"),
    `region`       AS `region`      @id("cc298e"),
    `update_time`  AS `update_time` @id("c39bd8"),
    CURRENT_DATE() AS `LOAD_DATE`   @id("23bcb1") @defaultValue("CURRENT_DATE()")
FROM {{ ref('SRC', 'clients') }} `clients`