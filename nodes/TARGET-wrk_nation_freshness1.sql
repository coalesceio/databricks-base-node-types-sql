@id("8284f0e2-935f-4ce0-b332-cdd38670f78b")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `timestamp_col` AS `ts_freshness_default` @freshness("1"),
     `timestamp_col` AS `ts_freshness_second` @freshness("30", "SECOND"),
     `timestamp_col` AS `ts_freshness_minute` @freshness("15", "MINUTE"),
     `timestamp_col` AS `ts_freshness_hour` @freshness("6", "HOUR"),
     `timestamp_col` AS `ts_freshness_day` @freshness("1", "DAY"),
     `timestamp_col` AS `ts_freshness_week` @freshness("1", "WEEK"),
     `timestamp_col` AS `ts_freshness_month` @freshness("1", "MONTH"),
     `timestamp_col` AS `ts_freshness_year` @freshness("1", "YEAR")
FROM {{ ref('SRC', 'nation') }} `nation`