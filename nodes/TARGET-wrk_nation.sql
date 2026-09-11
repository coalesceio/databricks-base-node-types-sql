@id("72c8cb34-ae38-4c9e-831a-da4ddd275d0f")
@nodeType("708")
@disableTests
SELECT DISTINCT
     -- NUMBER column: full numeric test coverage
     `N_NATIONKEY` AS `N_NATIONKEY` @notNull @not_null @uniqueness @min_value(`0`) @max_value(`100`) @accepted_values(`1`) @accepted_values(`2`) @inHash(`GH_COL1`, 2) @description(`Nation key`),

     -- VARCHAR column: full string test coverage
     `N_NAME` AS `N_NAME` @not_null @empty @accepted_values(`'ALGERIA'`) @accepted_values(`'ARGENTINA'`) @rejected_values(`'UNKNOWN'`) @inHash(`GH_COL1`, 1) @description(`Nation name`),

     -- NUMBER column: range + accepted_values(number) + rejected_values(number)
     `N_REGIONKEY` AS `N_REGIONKEY` @min_max(`0`, `4`) @notNull @defaultValue(`20`) @accepted_values(`0`) @accepted_values(`1`) @accepted_values(`2`) @accepted_values(`3`) @accepted_values(`4`) @rejected_values(`-1`) @description(`Region key`),

     -- VARCHAR column: rejected_values(string)
     `N_COMMENT` AS `N_COMMENT` @rejected_values(`'NA'`) @rejected_values(`''`) @description(`Comment`),

     -- TIMESTAMP_LTZ column: freshness with every supported unit + relative_time
     `timestamp_col` AS L_M_1 @freshness(30, `SECOND`) @relative_time(`<=`, `L_M_2`) @description(`freshness in SECOND`),
     `timestamp_col` AS L_M_2 @freshness(30, `MINUTE`) @description(`freshness in MINUTE / comparison column for L_M_1`),
     `timestamp_col` AS L_M_3 @freshness(24, `HOUR`) @relative_time(`>=`, `L_M_4`) @description(`freshness in HOUR`),
     `timestamp_col` AS L_M_4 @freshness(7, `DAY`) @description(`freshness in DAY / comparison column for L_M_3`),
     `timestamp_col` AS L_M_5 @freshness(4, `WEEK`) @relative_time(`=`, `L_M_6`) @description(`freshness in WEEK`),
     `timestamp_col` AS L_M_6 @freshness(3, `MONTH`) @description(`freshness in MONTH / comparison column for L_M_5`),
     `timestamp_col` AS L_M_7 @freshness(1, `YEAR`) @relative_time(`<>`, `L_M_8`) @description(`freshness in YEAR`),
     `timestamp_col` AS L_M_8 @description(`comparison column for L_M_7`),

     -- Additional datatype coverage via transformations off existing source columns
     CAST(`N_NATIONKEY` AS FLOAT) AS N_NATIONKEY_FLOAT @description(`FLOAT variant of N_NATIONKEY`),
     CAST(`N_NATIONKEY` AS VARCHAR(10)) AS N_NATIONKEY_STRING @description(`STRING variant of N_NATIONKEY`),
     CAST(`N_REGIONKEY` > 2 AS BOOLEAN) AS N_REGIONKEY_FLAG @description(`BOOLEAN derived from N_REGIONKEY`),
     CAST(`timestamp_col` AS DATE) AS N_LOAD_DATE @freshness(7, `DAY`) @description(`DATE variant of timestamp_col`),
     CAST(`timestamp_col` AS TIMESTAMP) AS N_LOAD_TIMESTAMP @description(`TIMESTAMP variant of timestamp_col`),
     CAST(`timestamp_col` AS TIME) AS N_LOAD_TIME @description(`TIME variant of timestamp_col`),
     CAST(`N_NATIONKEY` AS DECIMAL(18,4)) AS N_NATIONKEY_DECIMAL @description(`DECIMAL/NUMERIC variant of N_NATIONKEY`),

     CAST({{ get_hash('GH_COL1') }} AS STRING) AS `GH_COL1` @description(`Hash Column`)
FROM {{ ref('SRC2', 'nation') }} `NATION_TEST`