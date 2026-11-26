@id("52722471-4712-496c-b5dd-09f4d63b767e")
@nodeType("SQLWork")
@description("Orders pipeline - work table: lineitem joined to orders, one row per order line with net and tax amounts")
@writeMode("truncateInsert")
SELECT
    `lineitem`.`l_orderkey`                                                         AS `l_orderkey`     @id("423a47") @not_null,
    `lineitem`.`l_linenumber`                                                       AS `l_linenumber`   @id("4ff4a3") @not_null,
    `orders`.`o_custkey`                                                            AS `o_custkey`      @id("102780"),
    `lineitem`.`l_partkey`                                                          AS `l_partkey`      @id("182ad8") @not_null,
    `lineitem`.`l_suppkey`                                                          AS `l_suppkey`      @id("7e6613") @not_null,
    `orders`.`o_orderdate`                                                          AS `o_orderdate`    @id("4314c3"),
    `orders`.`o_orderstatus`                                                        AS `o_orderstatus`  @id("2cc865"),
    `lineitem`.`l_shipdate`                                                         AS `l_shipdate`     @id("182196"),
    `lineitem`.`l_quantity`                                                         AS `l_quantity`     @id("727693"),
    CAST(`lineitem`.`l_extendedprice` * (1 - `lineitem`.`l_discount`) AS DECIMAL(18,2)) AS `net_amount` @id("c8e4c1"),
    CAST(`lineitem`.`l_extendedprice` * (1 - `lineitem`.`l_discount`) * `lineitem`.`l_tax` AS DECIMAL(18,2)) AS `tax_amount` @id("11e595")
FROM {{ ref('SRC2', 'lineitem') }} `lineitem`
INNER JOIN {{ ref('SRC2', 'orders') }} `orders`
    ON `lineitem`.`l_orderkey` = `orders`.`o_orderkey`
