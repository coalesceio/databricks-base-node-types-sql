@id("6b2808f5-da82-4ddd-aebb-2cfa0d10bc13")
@nodeType("SQLDimension")
@description("zeroKey with defaults - only the surrogate key value is given, so strings get 'UNKNOWN', dates/timestamps 1900-01-01 00:00:00, booleans TRUE and numerics 0")
@mergeStrategy("changeTracking")
@zeroKey("0")
WITH `CUSTOMER_ORDERS` AS (
    SELECT
        `o_custkey`,
        MAX(`o_orderdate`) AS `last_order_date`
    FROM {{ ref('SRC2', 'orders') }}
    GROUP BY `o_custkey`
)
SELECT
    CAST(0 AS BIGINT)                                AS `dim_customer_zero_key_default_KEY` @id("be06a4") @isSurrogateKey,
    `customer`.`c_custkey`                           AS `c_custkey`          @id("e3ffd0") @isBusinessKey,
    `customer`.`c_name`                              AS `c_name`             @id("6de8f5"),
    `customer`.`c_nationkey`                         AS `c_nationkey`        @id("3c3e62"),
    `customer`.`c_mktsegment`                        AS `c_mktsegment`       @id("64c644"),
    `customer`.`c_acctbal`                           AS `c_acctbal`          @id("d163d5"),
    `CUSTOMER_ORDERS`.`last_order_date`              AS `last_order_date`    @id("689216"),
    CAST(`CUSTOMER_ORDERS`.`o_custkey` IS NOT NULL AS BOOLEAN) AS `has_orders` @id("e7d792"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)             AS `SYSTEM_CREATE_DATE` @id("6fe79f") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)             AS `SYSTEM_UPDATE_DATE` @id("8a5550") @isSystemUpdateDate
FROM {{ ref('SRC2', 'customer') }} `customer`
LEFT JOIN `CUSTOMER_ORDERS`
    ON `customer`.`c_custkey` = `CUSTOMER_ORDERS`.`o_custkey`
