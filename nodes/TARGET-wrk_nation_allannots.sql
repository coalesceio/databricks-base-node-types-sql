@id("e13209f1-da83-4e3e-a168-da54ae3ca545")
@nodeType("708")
@description("Adding every supporting annotation")
@writeMode("truncateInsert")
@disableTests("false")
@tests("SELECT 1 FROM {{ this }} GROUP BY N_NATIONKEY HAVING COUNT(*) > 1", false)
@tests("SELECT 1 WHERE 1=0")
@preSQL("SELECT 1")
@postSQL("SELECT 1")
SELECT
     `n_nationkey` AS `n_nationkey`  @inHash("GH_NATION", "1"),
     `n_regionkey` AS `n_regionkey` @min_max("0", "4") @inHash("GH_NATION", "2"),
     `n_name` AS `n_name` @empty @accepted_values("'ALGERIA'") @accepted_values("'ARGENTINA'") @rejected_values("'UNKNOWN'") @description("Nation name"),
     `n_comment` AS `n_comment` @defaultValue("'NA'"),
     `timestamp_col` AS `ts_base` @id("ts-base-col"),
     `timestamp_col` AS `ts_freshness_default` @freshness("1"),
     `timestamp_col` AS `ts_freshness_second` @freshness("30", "SECOND"),
     `timestamp_col` AS `ts_freshness_minute` @freshness("15", "MINUTE"),
     `timestamp_col` AS `ts_freshness_hour` @freshness("6", "HOUR"),
     `timestamp_col` AS `ts_freshness_day` @freshness("1", "DAY"),
     `timestamp_col` AS `ts_freshness_week` @freshness("1", "WEEK"),
     `timestamp_col` AS `ts_freshness_month` @freshness("1", "MONTH"),
     `timestamp_col` AS `ts_freshness_year` @freshness("1", "YEAR"),
     CAST(`timestamp_col` - INTERVAL 1 DAY AS TIMESTAMP) AS `ts_lt` @relative_time("<", "ts_base"),
     `timestamp_col` AS `ts_lte` @relative_time("<=", "ts_base"),
     CAST(`timestamp_col` + INTERVAL 1 DAY AS TIMESTAMP) AS `ts_gt` @relative_time(">", "ts_base"),
     `timestamp_col` AS `ts_gte` @relative_time(">=", "ts_base"),
     `timestamp_col` AS `ts_eq` @relative_time("=", "ts_base"),
     CAST(`timestamp_col` + INTERVAL 1 HOUR AS TIMESTAMP) AS `ts_ne` @relative_time("<>", "ts_base")
FROM {{ ref('SRC', 'nation') }} `nation`