@id("ee4ac778-6f66-40e3-ad2e-154a734eddb3")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey` @not_null @uniqueness @min_value("0") @max_value("24") @inHash("GH_NATION", "1"),
     `n_name` AS `n_name` @empty @accepted_values("'ALGERIA'") @rejected_values("'UNKNOWN'"),
     `n_regionkey` AS `n_regionkey` @min_max("0", "4") @inHash("GH_NATION", "2"),
     `n_comment` AS `n_comment`
FROM {{ ref('SRC', 'nation') }} `nation`
