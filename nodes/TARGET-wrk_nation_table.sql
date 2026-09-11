@id("ea711ab8-cf55-4357-9edb-c5c49d7ce916")
@nodeType("708")
@description("@description(""<text>"")")
@disableTests
@preSQL("SELECT 1")
@tests("SELECT 1")
@postSQL("SELECT 1")
SELECT
     `n_nationkey` AS `n_nationkey` @description("<text-mod>")  @defaultValue("10"),
     `n_name` AS `n_name`  @not_null @empty @notNull,
     `n_regionkey` AS `n_regionkey_1` @description("<text>"),
     `n_comment` AS `n_comment` @defaultValue("'NA'"),
     `timestamp_col` AS `timestamp_col`,
     `n_comment` AS `n_comment_MOD` @defaultValue("'NA'")
FROM {{ ref('SRC2', 'nation') }} `nation`
where n_nationkey = {{ parameters.nation }}