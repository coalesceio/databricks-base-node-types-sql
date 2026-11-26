@id("cddfdb7c-9ccf-4f32-8a3a-b3d210720a01")
@nodeType("SQLDimension")
@description("SCD pipeline - mergeStrategy lastModified, SCD Type 1 on timestamp_col")
@mergeStrategy("lastModified")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_nation_lm_scd1_KEY` @id("509f9d") @isSurrogateKey,
    `n_nationkey`                        AS `n_nationkey`            @id("38a1d2") @isBusinessKey,
    `n_name`                             AS `n_name`                 @id("4a83f1"),
    `n_regionkey`                        AS `n_regionkey`            @id("84ae01"),
    `r_name`                             AS `r_name`                 @id("39809c"),
    `n_comment`                          AS `n_comment`              @id("e2e226"),
    `timestamp_col`                      AS `timestamp_col`          @id("4b7603") @lastModifiedTracking(1),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`     @id("485e10") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`     @id("21663b") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_nation_scd') }} `wrk_nation_scd`
