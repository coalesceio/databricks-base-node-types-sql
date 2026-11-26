@id("e2163b63-2547-489a-a15a-70a267d53ee9")
@nodeType("SQLDimension")
@description("Orders pipeline - supplier dimension, mergeStrategy changeTracking, SCD Type 2 on s_address and s_phone")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_supplier_KEY`    @id("4b92e9") @isSurrogateKey,
    `s_suppkey`                              AS `s_suppkey`           @id("46ff32") @isBusinessKey,
    `s_name`                                 AS `s_name`              @id("13c811"),
    `s_address`                              AS `s_address`           @id("a31082") @isChangeTracking,
    `s_phone`                                AS `s_phone`             @id("1a0c2d") @isChangeTracking,
    `s_acctbal`                              AS `s_acctbal`           @id("1ab9c9"),
    `n_name`                                 AS `n_name`              @id("4772da"),
    `r_name`                                 AS `r_name`              @id("942a67"),
    1                                        AS `SYSTEM_VERSION`      @id("79a84c") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG` @id("c202a3") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`  @id("ce5229") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`  @id("d11d7d") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`     @id("3aa315") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_supplier_nation') }} `wrk_supplier_nation`
