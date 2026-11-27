@id("38dd74c0-cc24-4c26-8454-25426b1fc76d")
@nodeType("SQLDimension")
@description("zeroKey with custom values - surrogate key -1, strings 'N/A', dates/timestamps 1999-12-31, booleans FALSE, plus column-level overrides on o_orderpriority and o_totalprice")
@mergeStrategy("changeTracking")
@zeroKey("-1", "'N/A'", "1999-12-31 00:00:00", false)
SELECT
    CAST(0 AS BIGINT)                                AS `dim_orders_zero_key_custom_KEY` @id("b6e587") @isSurrogateKey,
    `o_orderkey`                                     AS `o_orderkey`         @id("28ec79") @isBusinessKey,
    `o_custkey`                                      AS `o_custkey`          @id("fa1eea"),
    `o_orderstatus`                                  AS `o_orderstatus`      @id("8e69d0") @isChangeTracking,
    `o_orderpriority`                                AS `o_orderpriority`    @id("04f369") @isChangeTracking @zeroKey("'0-NOT SPECIFIED'"),
    `o_totalprice`                                   AS `o_totalprice`       @id("9fbfe8") @zeroKey("-1"),
    `o_orderdate`                                    AS `o_orderdate`        @id("073138"),
    CAST(`o_orderdate` AS TIMESTAMP)                 AS `o_order_ts`         @id("8ecade"),
    CAST(`o_orderpriority` LIKE '1-%' AS BOOLEAN)    AS `is_urgent`          @id("bbda2d"),
    1                                                AS `SYSTEM_VERSION`      @id("440b9c") @isSystemVersion,
    CAST('Y' AS STRING)                              AS `SYSTEM_CURRENT_FLAG` @id("445fd4") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)             AS `SYSTEM_CREATE_DATE`  @id("316674") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)             AS `SYSTEM_UPDATE_DATE`  @id("94afc8") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP)         AS `SYSTEM_END_DATE`     @id("1b4925") @isSystemEndDate
FROM {{ ref('SRC2', 'orders') }} `orders`
