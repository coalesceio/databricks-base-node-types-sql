@id("eab7e0fb-c463-4da8-9ce3-da522e0ca4dd")
@nodeType("SQLFact")
@description("Orders pipeline - order line fact (composite business key l_orderkey + l_linenumber) keyed to dim_part and the current dim_supplier row")
@mergeStrategy("changeTracking")
SELECT
    `wrk_order_lines`.`l_orderkey`          AS `l_orderkey`         @id("0ee554") @isBusinessKey,
    `wrk_order_lines`.`l_linenumber`        AS `l_linenumber`       @id("b5378c") @isBusinessKey,
    `dim_part`.`dim_part_KEY`               AS `dim_part_KEY`       @id("cb0b37"),
    `dim_supplier`.`dim_supplier_KEY`       AS `dim_supplier_KEY`   @id("404167"),
    `wrk_order_lines`.`o_custkey`           AS `o_custkey`          @id("0b13e1"),
    `wrk_order_lines`.`o_orderdate`         AS `o_orderdate`        @id("7ac748"),
    `wrk_order_lines`.`o_orderstatus`       AS `o_orderstatus`      @id("fb9b9b"),
    `wrk_order_lines`.`l_shipdate`          AS `l_shipdate`         @id("4dbe06"),
    `wrk_order_lines`.`l_quantity`          AS `l_quantity`         @id("c9cdc2"),
    `wrk_order_lines`.`net_amount`          AS `net_amount`         @id("52deaa"),
    `wrk_order_lines`.`tax_amount`          AS `tax_amount`         @id("9d647e"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)    AS `SYSTEM_CREATE_DATE` @id("a50780") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)    AS `SYSTEM_UPDATE_DATE` @id("e79005") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_order_lines') }} `wrk_order_lines`
LEFT JOIN {{ ref('TARGET', 'dim_part') }} `dim_part`
    ON `wrk_order_lines`.`l_partkey` = `dim_part`.`p_partkey`
LEFT JOIN {{ ref('TARGET', 'dim_supplier') }} `dim_supplier`
    ON  `wrk_order_lines`.`l_suppkey` = `dim_supplier`.`s_suppkey`
    AND `dim_supplier`.`SYSTEM_CURRENT_FLAG` = 'Y'
