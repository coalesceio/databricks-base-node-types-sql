@id("995bf658-b580-4aec-876d-c195715cad5c")
@nodeType("708")
@materializationType("view")
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
FROM {{ ref('TARGET', 'wrk_nation_region_orders_lineitem') }} `wrk_nation_region_orders_lineitem`