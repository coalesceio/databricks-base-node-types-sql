@id("b94ae332-1ef1-45f3-b76d-429e735143bb")
@nodeType("SQLFact")
@description("Every data quality test - node-level Before/After tests and every column-level test")
@mergeStrategy("upsert")
@tests("SELECT `client_id` FROM {{ this }} WHERE `client_id` IS NULL", true, "Before")
@tests("SELECT `client_id` FROM {{ this }} GROUP BY `client_id` HAVING COUNT(*) > 1", true, "After")
SELECT
    `client_id`                                                          AS `client_id`          @id("faefdf") @isBusinessKey @not_null @uniqueness @min_max("-2147483648", "2147483647"),
    `client_name`                                                        AS `client_name`        @id("724d65") @empty @rejected_values("'REJECTED_TEST_VALUE'"),
    `email`                                                              AS `email`              @id("9d8a09"),
    `region`                                                             AS `region`             @id("759fd7"),
    `update_time`                                                        AS `update_time`        @id("c725f1"),
    CAST(CASE WHEN `region` = 'UNKNOWN' THEN 'N' ELSE 'Y' END AS STRING) AS `region_known`       @id("8c174b") @accepted_values("'Y'") @accepted_values("'N'"),
    LENGTH(`client_name`)                                                AS `name_length`        @id("c57bae") @min_value("1") @max_value("100000"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                                 AS `LOAD_TIMESTAMP`     @id("77066a") @freshness(1, "DAY"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                                 AS `SYSTEM_CREATE_DATE` @id("8e83ef") @isSystemCreateDate @relative_time("<=", "SYSTEM_UPDATE_DATE"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                                 AS `SYSTEM_UPDATE_DATE` @id("cdb26b") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
