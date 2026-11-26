@id("078d840e-7bdc-42f4-b7ec-bf385a9d2f34")
@nodeType("SQLDimension")
@description("SCD pipeline - mergeStrategy lastModified, SCD Type 2 on timestamp_col")
@mergeStrategy("lastModified")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_nation_lm_scd2_KEY` @id("016489") @isSurrogateKey,
    `n_nationkey`                            AS `n_nationkey`            @id("3b01da") @isBusinessKey,
    `n_name`                                 AS `n_name`                 @id("4c85f3"),
    `n_regionkey`                            AS `n_regionkey`            @id("602cd5"),
    `r_name`                                 AS `r_name`                 @id("4abb34"),
    `n_comment`                              AS `n_comment`              @id("c99fd4"),
    `timestamp_col`                          AS `timestamp_col`          @id("47c73b") @lastModifiedTracking(2),
    1                                        AS `SYSTEM_VERSION`         @id("23c69f") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`    @id("302186") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`     @id("1c06b1") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`     @id("f6d0ce") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`        @id("caeae2") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_nation_scd') }} `wrk_nation_scd`
