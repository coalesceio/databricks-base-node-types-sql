@id("8f6be7ad-cb9d-46bb-bb7f-1c854dac04cd")
@nodeType("708")
@postSQL("CREATE OR REPLACE TABLE `coalesce`.`target_dev`.`region_summary` AS SELECT `n_regionkey` AS `region_key`, COUNT(*) AS `nation_count` FROM {{ ref('TARGET', 'wrk_nation_region_summary') }} GROUP BY `n_regionkey`")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_name` AS `n_name`,
     `n_regionkey` AS `n_regionkey`,
     `n_comment` AS `n_comment`
FROM {{ ref('SRC', 'nation') }} `nation`
