@id("745bbf62-7311-4656-becd-cb35d5d2372c")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_name` AS `n_name`,
     `n_regionkey` AS `n_regionkey`,
     `r_name` AS `r_name`,
     `n_comment` AS `n_comment`
FROM {{ ref('SRC', 'nation') }} `nation`
JOIN {{ ref('SRC', 'region') }} `region` ON `nation`.`n_regionkey` = `region`.`r_regionkey`
