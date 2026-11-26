@id("563235c0-75b4-46f5-ab47-c641dc534a01")
@nodeType("SQLDimension")
@description("SCD pipeline - mergeStrategy changeTracking, SCD Type 1 (no isChangeTracking column, all attributes overwritten in place)")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_nation_scd1_KEY` @id("303cd9") @isSurrogateKey,
    `n_nationkey`                        AS `n_nationkey`         @id("ee9e62") @isBusinessKey,
    `n_name`                             AS `n_name`              @id("28be06"),
    `n_regionkey`                        AS `n_regionkey`         @id("50340b"),
    `r_name`                             AS `r_name`              @id("49264c"),
    `n_comment`                          AS `n_comment`           @id("87c344"),
    `timestamp_col`                      AS `timestamp_col`       @id("a91d1f"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`  @id("1e4e89") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`  @id("db5687") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_nation_scd') }} `wrk_nation_scd`
