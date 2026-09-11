@id("47bd5c3a-6069-4b27-b050-c70a82f4a961")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_name` AS `n_name`,
     `n_regionkey` AS `n_regionkey`,
     `n_comment` AS `n_comment`,
     `timestamp_col` AS `timestamp_col`
FROM {{ ref('SRC', 'nation') }} `nation`