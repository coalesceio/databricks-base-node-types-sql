@id("047be13f-f786-40ce-8955-1e3af2784341")
@nodeType("SQLDimension")
@description("SCD pipeline - mergeStrategy changeTracking, SCD Type 2 on n_name and r_name (isChangeTracking)")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_nation_scd2_KEY` @id("166f1b") @isSurrogateKey,
    `n_nationkey`                            AS `n_nationkey`         @id("27f4f3") @isBusinessKey,
    `n_name`                                 AS `n_name`              @id("3fda45") @isChangeTracking,
    `n_regionkey`                            AS `n_regionkey`         @id("2a48e2"),
    `r_name`                                 AS `r_name`              @id("7bbbf9") @isChangeTracking,
    `n_comment`                              AS `n_comment`           @id("c11429"),
    `timestamp_col`                          AS `timestamp_col`       @id("d68aef"),
    1                                        AS `SYSTEM_VERSION`      @id("236983") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG` @id("b7d2f6") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`  @id("ac1fa3") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`  @id("ef9a65") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`     @id("0d13d4") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_nation_scd') }} `wrk_nation_scd`
