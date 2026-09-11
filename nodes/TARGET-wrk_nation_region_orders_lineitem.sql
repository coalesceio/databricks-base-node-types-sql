@id("1696f695-11b3-4440-bbee-671e2c118685")
@nodeType("708")
SELECT
     `n_nationkey` AS `n_nationkey`,
     `n_name` AS `n_name`,
     `n_regionkey` AS `n_regionkey`,
     `r_name` AS `r_name`,
     `o_orderkey` AS `o_orderkey`,
     `o_orderstatus` AS `o_orderstatus`,
     `o_totalprice` AS `o_totalprice`,
     `o_orderdate` AS `o_orderdate`,
     `l_linenumber` AS `l_linenumber`,
     `l_quantity` AS `l_quantity`,
     `l_extendedprice` AS `l_extendedprice`,
     `l_discount` AS `l_discount`,
     `l_returnflag` AS `l_returnflag`
FROM {{ ref('TARGET', 'wrk_nation_region') }} `nation_region`
JOIN {{ ref('SRC2', 'customer') }} `customer` ON `customer`.`c_nationkey` = `nation_region`.`n_nationkey`
JOIN {{ ref('SRC2', 'orders') }} `orders` ON `orders`.`o_custkey` = `customer`.`c_custkey`
JOIN {{ ref('SRC2', 'lineitem') }} `lineitem` ON `lineitem`.`l_orderkey` = `orders`.`o_orderkey`
