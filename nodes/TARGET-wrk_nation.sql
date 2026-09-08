@id("5db4ab0d-1158-4b80-928e-ac8d820a9808")
@nodeType("708")
@writeMode("append")
@disableTests("false")
@tests("SELECT 1 WHERE 1=0")
@preSQL("SELECT 1")
@postSQL("SELECT 1")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_name` AS `n_name`,
     `n_regionkey` AS `n_regionkey`,
     `n_comment` AS `n_comment`
FROM {{ ref('SRC', 'nation') }} `nation`