@id("f70c6070-b8a3-452e-b824-5c866bd1d50a")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_name` AS `n_name`,
     `n_regionkey` AS `n_regionkey`,
     `n_comment` AS `n_comment`,
     `timestamp_col` AS `timestamp_col`
FROM {{ ref('SRC', 'nation') }} `nation`