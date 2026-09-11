@id("34545460-559e-46c5-b673-37180dac170f")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `timestamp_col` AS `ts_base`,
     CAST(`timestamp_col` - INTERVAL 1 DAY AS TIMESTAMP) AS `ts_lt` @relative_time("<", "ts_base"),
     `timestamp_col` AS `ts_lte` @relative_time("<=", "ts_base"),
     CAST(`timestamp_col` + INTERVAL 1 DAY AS TIMESTAMP) AS `ts_gt` @relative_time(">", "ts_base"),
     `timestamp_col` AS `ts_gte` @relative_time(">=", "ts_base"),
     `timestamp_col` AS `ts_eq` @relative_time("=", "ts_base"),
     CAST(`timestamp_col` + INTERVAL 1 HOUR AS TIMESTAMP) AS `ts_ne` @relative_time("<>", "ts_base"),
     CAST(`timestamp_col` + INTERVAL 1 HOUR AS TIMESTAMP) AS `ts_ne2`
FROM {{ ref('SRC', 'nation') }} `nation`
