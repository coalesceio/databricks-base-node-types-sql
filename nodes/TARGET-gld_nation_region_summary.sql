@id("7c5ca4f9-0275-4af4-a1bb-b10e8eb76423")
@nodeType("708")
@writeMode("truncateInsert")
SELECT
     `region_key` AS `region_key` @not_null @uniqueness @description("Region key this summary row aggregates."),
     COUNT(*) AS `nation_count` @not_null @description("Number of nations belonging to this region."),
     COUNT(DISTINCT `nation_name`) AS `distinct_nation_name_count` @description("Distinct nation-name count for this region, used as a data-quality signal."),
     MAX(`_silver_processed_at`) AS `_gold_refreshed_at` @description("Timestamp this Gold summary was last refreshed.")
FROM {{ ref('TARGET', 'slv_nation') }} `slv_nation`
GROUP BY `region_key`
