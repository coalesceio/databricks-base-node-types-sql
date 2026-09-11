@id("9caf3512-523f-42ed-99a9-b1fd7d970e68")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey` @not_null @uniqueness @description("Natural key for the nation."),
     `n_name` AS `n_name` @not_null @description("Nation name."),
     `n_regionkey` AS `n_regionkey` @not_null @description("Region key this nation belongs to."),
     `n_comment` AS `n_comment` @description("Nation comment.")
FROM {{ ref('SRC', 'nation') }} `nation`
