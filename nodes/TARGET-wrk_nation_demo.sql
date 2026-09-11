@id("7ea1b0bf-f440-499a-9767-e1c2ac363ad9")
@nodeType("708")
@disableTests
@tests("SELECT 1 WHERE 1=0")
@preSQL("SELECT 1")
@postSQL("SELECT 1")
SELECT
     `n_nationkey` AS `n_nationkey` @not_null @uniqueness @min_value("0") @max_value("24") @inHash("GH_NATION", "1"),
     `n_regionkey` AS `n_regionkey` @min_max("0", "4") @inHash("GH_NATION", "2"),
     `n_name` AS `n_name` @empty @accepted_values("'ALGERIA'") @accepted_values("'ARGENTINA'") @rejected_values("'UNKNOWN'") @description("Nation name"),
     `n_comment` AS `n_comment` @defaultValue("'NA'"),
     `timestamp_col` AS `ts_base` @id("ts-base-col"),
     `timestamp_col` AS `ts_freshness` @freshness("1", "DAY"),
     CAST(`timestamp_col` + INTERVAL 1 DAY AS TIMESTAMP) AS `ts_relative` @relative_time(">", "ts_base")
FROM {{ ref('SRC', 'nation') }} `nation`