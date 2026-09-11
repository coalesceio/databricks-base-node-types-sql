@id("2766cfeb-0451-4cc5-9b80-ad1140622501")
@nodeType("708")
@description("@description(""<text>"")")
@disableTests
@preSQL("SELECT 1")
@tests("SELECT 1")
@postSQL("SELECT 1")
SELECT ALL
     CAST(`n_nationkey` AS INTEGER) AS `n_nationkey` @description("<text-mod>")  @defaultValue("10"),
     `n_name` AS `n_name`  @not_null @empty @notNull,
     `n_regionkey` AS `n_regionkey_1` @description("<text>"),
     `n_comment` AS `n_comment` @defaultValue("'NA'"),
     `timestamp_col` AS `timestamp_col`,
     `n_comment` AS `n_comment_MOD` @defaultValue("'NA'"),
     CAST(
     SHA1(
          IFNULL(CAST(`n_nationkey` AS STRING), 'null') || '||' || IFNULL(CAST(`n_regionkey` AS STRING), 'null')
     ) AS STRING
     ) AS `hash_key_sha1_default`
FROM {{ ref('SRC2', 'nation') }} `nation`
where n_nationkey = {{ parameters.nation }}