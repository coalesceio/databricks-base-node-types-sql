@id("26d95bd3-f4da-48d7-ac0e-98beb0a21292")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_name` AS `n_name`,
     `n_regionkey` AS `n_regionkey`,
     `n_comment` AS `n_comment`
FROM {{ ref('SRC2', 'nation') }} `nation`