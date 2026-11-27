@id("a8c4a1c1-b61b-452f-8ffc-5bf800a9aa03")
@nodeType("SQLFact")
@description("Orders pipeline - daily order summary by order date and supplier region; no business key, plain insert with truncateInsert")
@writeMode("truncateInsert")
SELECT
    `fct_order_lines`.`o_orderdate`                 AS `o_orderdate`    @id("f5777b") @not_null,
    `dim_supplier`.`r_name`                         AS `supplier_region` @id("9855ab"),
    COUNT(DISTINCT `fct_order_lines`.`l_orderkey`)  AS `order_count`    @id("2a9102"),
    COUNT(*)                                        AS `line_count`     @id("a63fb5"),
    SUM(`fct_order_lines`.`l_quantity`)             AS `total_quantity` @id("cb79e3"),
    SUM(`fct_order_lines`.`net_amount`)             AS `total_net_amount` @id("7cd8d1"),
    SUM(`fct_order_lines`.`tax_amount`)             AS `total_tax_amount` @id("073369"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)            AS `LOAD_TIMESTAMP` @id("de5fe1")
FROM {{ ref('TARGET', 'fct_order_lines') }} `fct_order_lines`
LEFT JOIN {{ ref('TARGET', 'dim_supplier') }} `dim_supplier`
    ON `fct_order_lines`.`dim_supplier_KEY` = `dim_supplier`.`dim_supplier_KEY`
WHERE `fct_order_lines`.`o_orderdate` IS NOT NULL
GROUP BY `fct_order_lines`.`o_orderdate`, `dim_supplier`.`r_name`
