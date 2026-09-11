@id("93c1b157-06f0-43ed-8f4f-319ca7b6ce6d")
@nodeType("708")
@description("@description(""<text>"")")
@preSQL("SELECT 1")
@tests("SELECT 1")
@postSQL("SELECT 1")
SELECT
     `n_nationkey` AS `n_nationkey` @description("<text>"),
     `n_name` AS `n_name` @not_null @empty,
     `n_regionkey` AS `n_regionkey`,
     `n_comment` AS `n_comment`,
     `timestamp_col` AS `timestamp_col`
FROM {{ ref('SRC2', 'nation') }} `nation`
where n_nationkey = {{ parameters.nation }}