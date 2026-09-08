@id("5db4ab0d-1158-4b80-928e-ac8d820a9808")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_name` AS `n_name`,
     `n_regionkey` AS `n_regionkey`,
     `n_comment` AS `n_comment`
FROM {{ ref('SRC', 'nation') }} `nation`