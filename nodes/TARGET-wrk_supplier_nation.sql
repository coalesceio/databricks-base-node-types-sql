@id("92b3f613-1065-4d1f-8140-4b1fa230e04b")
@nodeType("SQLWork")
@description("Orders pipeline - work view: supplier enriched with nation and region names")
@materializationType("view")
SELECT
    `supplier`.`s_suppkey`                                   AS `s_suppkey`  @id("27260c"),
    `supplier`.`s_name`                                      AS `s_name`     @id("ccc714"),
    `supplier`.`s_address`                                   AS `s_address`  @id("878306"),
    `supplier`.`s_phone`                                     AS `s_phone`    @id("7dbdd5"),
    `supplier`.`s_acctbal`                                   AS `s_acctbal`  @id("010d3e"),
    CAST(COALESCE(`nation`.`n_name`, 'UNKNOWN') AS STRING)   AS `n_name`     @id("37aee4"),
    CAST(COALESCE(`region`.`r_name`, 'UNKNOWN') AS STRING)   AS `r_name`     @id("069a88")
FROM {{ ref('SRC2', 'supplier') }} `supplier`
LEFT JOIN {{ ref('SRC2', 'nation') }} `nation`
    ON `supplier`.`s_nationkey` = `nation`.`n_nationkey`
LEFT JOIN {{ ref('SRC2', 'region') }} `region`
    ON `nation`.`n_regionkey` = `region`.`r_regionkey`
