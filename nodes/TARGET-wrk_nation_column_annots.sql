@id("24fb194f-5eaf-42b8-ac91-42e81026acd9")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey` @not_null @uniqueness,
     `n_name` AS `n_name` @description("name col"), 
     `n_regionkey` AS `n_regionkey` @empty,
     `n_comment` AS `n_comment` @defaultValue("'NA'")
FROM {{ ref('SRC', 'nation') }} `nation`