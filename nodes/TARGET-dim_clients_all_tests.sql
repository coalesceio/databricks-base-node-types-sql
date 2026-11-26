@id("9bf538f2-2ddd-4534-b370-9fd1dacdfad1")
@nodeType("733")
@description("Every data quality test - node-level Before/After tests and every column-level test")
@mergeStrategy("upsert")
@disableTests(false)
@tests("SELECT `client_id` FROM {{ this }} WHERE `client_id` IS NULL", true, "Before")
@tests("SELECT `client_id` FROM {{ this }} GROUP BY `client_id` HAVING COUNT(*) > 1", true, "After")
SELECT
    CAST(0 AS BIGINT)                                    AS `dim_clients_all_tests_KEY` @id("abbbe9") @isSurrogateKey,
    `client_id`                                          AS `client_id`                 @id("bc8b58") @isBusinessKey @not_null @uniqueness @min_max("-2147483648", "2147483647"),
    `client_name`                                        AS `client_name`               @id("e1e937") @empty @rejected_values("'REJECTED_TEST_VALUE'"),
    `email`                                              AS `email`                     @id("09efe9"),
    `region`                                             AS `region`                    @id("830781"),
    `update_time`                                        AS `update_time`               @id("61651a"),
    CAST(CASE WHEN `region` = 'UNKNOWN' THEN 'N' ELSE 'Y' END AS STRING) AS `region_known`              @id("52e336") @accepted_values("'Y'") @accepted_values("'N'"),
    LENGTH(`client_name`)                                AS `name_length`               @id("7a297d") @min_value("1") @max_value("100000"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                 AS `LOAD_TIMESTAMP`            @id("ea4fdf") @freshness(1, "DAY"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                 AS `SYSTEM_CREATE_DATE`        @id("93b789") @isSystemCreateDate @relative_time("<=", "SYSTEM_UPDATE_DATE"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                 AS `SYSTEM_UPDATE_DATE`        @id("2b9f4c") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
