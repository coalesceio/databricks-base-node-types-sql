@id("c7fffe06-57de-43e9-84fa-d3a5be76d631")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_regionkey` AS `n_regionkey`,
     `n_comment` AS `n_comment`,
     `timestamp_col` AS `timestamp_col`
FROM {{ ref('SRC', 'nation') }} `nation`