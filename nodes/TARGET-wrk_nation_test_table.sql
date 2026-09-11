@id("c4dfa9af-e227-482d-8855-668e95aafd96")
@nodeType("708")
@materializationType("table")
@writeMode("append")
@tests("SELECT 1 FROM {{ this }} GROUP BY N_NATIONKEY HAVING COUNT(*) > 1")
@tests("SELECT 1 FROM {{ this }} WHERE N_REGIONKEY IS NULL")
@description("Table description")
@preSQL("CREATE TABLE IF NOT EXISTS `coalesce`.`target_dev`.`load_log` (`table_name` STRING, `load_ts` TIMESTAMP)")
@preSQL("DELETE FROM {{ this }} WHERE L_M_1 < CURRENT_DATE() - INTERVAL 90 DAY")
@postSQL("INSERT INTO `coalesce`.`target_dev`.`load_log` (`table_name`, `load_ts`) VALUES ('WRK_NATION', CURRENT_TIMESTAMP())")
SELECT
     CAST(`N_NATIONKEY` AS FLOAT) AS `N_NATIONKEY` @not_null @uniqueness @min_value("0") @max_value("100")  @accepted_values("1") @inHash("GH_COL1", 2),
     `N_NAME` AS `N_NAME` @not_null @empty @accepted_values("'ALGERIA'") @accepted_values("'ARGENTINA'") @inHash("GH_COL1", 1),
     CAST(`N_REGIONKEY` AS DOUBLE) AS `N_REGIONKEY`  @min_max("0", "4") @not_null @defaultValue("20"),
     `N_COMMENT` AS `N_COMMENT` @rejected_values("'NA'"),
     `timestamp_col` AS L_M_1 @freshness(7, "DAY") @relative_time("<", "L_M_2") @description("timestamp column"),
     `timestamp_col` AS L_M_2,
     CAST({{ get_hash('GH_COL1') }} AS STRING) AS `GH_COL1` @description("Hash Column")
FROM {{ ref('SRC', 'nation') }} `nation`