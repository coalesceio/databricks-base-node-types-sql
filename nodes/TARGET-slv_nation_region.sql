@id("ebf7ec59-2368-4e9e-94ae-e537debc65d3")
@nodeType("708")
SELECT
     `nation`.`nation_key` AS `nation_key` @not_null @uniqueness @description("Natural key for the nation."),
     TRIM(UPPER(`nation`.`nation_name`)) AS `nation_name` @not_null @empty @description("Nation name, trimmed and upper-cased for consistency."),
     `nation`.`region_key` AS `region_key` @not_null @min_value("0") @max_value("4") @description("Region key, validated against the known TPC-H region range."),
     TRIM(UPPER(`region`.`region_name`)) AS `region_name` @not_null @description("Region name, trimmed and upper-cased for consistency."),
     NULLIF(TRIM(`nation`.`nation_comment`), '') AS `nation_comment` @description("Nation comment with surrounding whitespace removed; blank comments normalized to NULL."),
     CURRENT_TIMESTAMP() AS `_silver_processed_at` @description("Timestamp this row was cleansed and conformed into the Silver layer.")
FROM {{ ref('TARGET', 'brz_nation') }} `nation`
JOIN {{ ref('TARGET', 'brz_region') }} `region` ON `nation`.`region_key` = `region`.`region_key`
