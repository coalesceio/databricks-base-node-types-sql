@id("27d90d93-c178-48cf-a0e1-8d20fe1599f9")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_name` AS `n_name`,
     `n_regionkey` AS `n_regionkey`,
     `n_comment` AS `n_comment`,
     `timestamp_col` AS `timestamp_col`
FROM {{ ref('SRC', 'nation') }} `nation`