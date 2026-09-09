@id("1839b587-b431-4258-80fa-a14d11c4c49e")
@nodeType("708")
SELECT
     `n_nationkey` AS `nation_key` @not_null @uniqueness @description("Natural key for the nation, carried through unchanged from the raw feed."),
     `n_name` AS `nation_name` @not_null @description("Raw nation name, unmodified from source."),
     `n_regionkey` AS `region_key` @not_null @description("Raw region key, unmodified from source."),
     `n_comment` AS `nation_comment` @description("Raw comment text, unmodified from source."),
     `timestamp_col` AS `source_timestamp` @description("Source-provided timestamp, unmodified."),
     CURRENT_TIMESTAMP() AS `_bronze_loaded_at` @description("Timestamp this row was ingested into the Bronze layer.")
FROM {{ ref('SRC', 'nation') }} `nation`
