@id("1485e769-0f6c-43ba-b84e-1100bf53359f")
@nodeType("708")
SELECT
     `nation_key` AS `nation_key` @not_null @uniqueness @description("Natural key for the nation."),
     TRIM(UPPER(`nation_name`)) AS `nation_name` @not_null @empty @description("Nation name, trimmed and upper-cased for consistency."),
     `region_key` AS `region_key` @not_null @min_value("0") @max_value("4") @description("Region key, validated against the known TPC-H region range."),
     NULLIF(TRIM(`nation_comment`), '') AS `nation_comment` @description("Comment text with surrounding whitespace removed; blank comments normalized to NULL."),
     `source_timestamp` AS `source_timestamp`,
     `_bronze_loaded_at` AS `_bronze_loaded_at`,
     CURRENT_TIMESTAMP() AS `_silver_processed_at` @description("Timestamp this row was cleansed and conformed into the Silver layer.")
FROM {{ ref('TARGET', 'brz_nation') }} `brz_nation`
