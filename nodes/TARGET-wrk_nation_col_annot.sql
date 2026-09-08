@id("5f6a5fa0-69ab-469b-bc95-cb9ef3202fdb")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey` @not_null @uniqueness,
     `n_name` AS `n_name` @description("name col"), 
     `n_regionkey` AS `n_regionkey` @empty,
     `n_comment` AS `n_comment` @defaultValue("'NA'")
FROM {{ ref('SRC', 'nation') }} `nation`