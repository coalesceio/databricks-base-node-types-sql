@id("3adc60fe-7447-4321-8abd-5f17eb440fe1")
@nodeType("708")
SELECT
     `r_regionkey` AS `region_key` @not_null @uniqueness @description("Natural key for the region, carried through unchanged from the raw feed."),
     `r_name` AS `region_name` @not_null @description("Raw region name, unmodified from source."),
     `r_comment` AS `region_comment` @description("Raw comment text, unmodified from source."),
     CURRENT_TIMESTAMP() AS `_bronze_loaded_at` @description("Timestamp this row was ingested into the Bronze layer.")
FROM {{ ref('SRC', 'region') }} `region`
