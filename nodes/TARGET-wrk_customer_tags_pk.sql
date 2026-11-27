@id("0ddb8137-9d16-4591-b7f5-d0fb20d2ec2f")
@nodeType("SQLWork")
@description("Work table - tags and primaryKey: node-level tags on the table, column-level tags on c_phone and c_address, informational PRIMARY KEY on c_custkey")
@writeMode("truncateInsert")
@tag("cost_center", "finance")
@tag("env", "dev")
SELECT
    `customer`.`c_custkey`                                                       AS `c_custkey`    @id("6f52d6") @primaryKey(1) @not_null @uniqueness,
    CAST(COALESCE(NULLIF(TRIM(`customer`.`c_name`), ''), 'UNKNOWN') AS STRING)   AS `c_name`       @id("459b6c"),
    CAST(`customer`.`c_address` AS STRING)                                       AS `c_address`    @id("d6ec0b") @tag("pii", "address"),
    CAST(`customer`.`c_phone` AS STRING)                                         AS `c_phone`      @id("28a1f9") @tag("pii", "phone"),
    `customer`.`c_nationkey`                                                     AS `c_nationkey`  @id("6037e7"),
    `customer`.`c_acctbal`                                                       AS `c_acctbal`    @id("b41e7a"),
    CAST(`customer`.`c_mktsegment` AS STRING)                                    AS `c_mktsegment` @id("e9c25d")
FROM {{ ref('SRC2', 'customer') }} `customer`
