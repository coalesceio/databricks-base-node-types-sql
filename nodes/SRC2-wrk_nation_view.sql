@id("6ae3b087-b6fb-4435-a2aa-2690ffcc004d")
@nodeType("708")
@description("@description(""<text>"")")
@materializationType("view")
@disableTests
@preSQL("SELECT 1")
@tests("SELECT 1")
@postSQL("SELECT 1")
SELECT
     `n_nationkey` AS `n_nationkey` @description("<text-nmod>"),
     `n_name` AS `n_name` @not_null @empty,
     `n_regionkey` AS `n_regionkey_1`,
     `n_comment` AS `n_comment`,
     `timestamp_col` AS `timestamp_col`,
     `n_comment` AS `n_comment_1` @defaultValue("'NA'") @notNull @description("<text>")
FROM {{ ref('SRC2', 'nation') }} `nation`
where n_nationkey = {{ parameters.nation }}