@id("8d37838d-8440-4f92-a30d-38b99623364c")
@nodeType("SQLDimension")
@description("Orders pipeline - part dimension, mergeStrategy upsert (matched rows updated, new rows inserted)")
@mergeStrategy("upsert")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_part_KEY`       @id("1f2e83") @isSurrogateKey,
    `p_partkey`                          AS `p_partkey`          @id("3a3cb7") @isBusinessKey,
    `p_name`                             AS `p_name`             @id("018be6"),
    `p_mfgr`                             AS `p_mfgr`             @id("ecc146"),
    `p_brand`                            AS `p_brand`            @id("e7fd6b"),
    `p_type`                             AS `p_type`             @id("436190"),
    `p_size`                             AS `p_size`             @id("f96a82"),
    `p_container`                        AS `p_container`        @id("662eb0"),
    `p_retailprice`                      AS `p_retailprice`      @id("a42f3b"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("33749b") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("93880d") @isSystemUpdateDate
FROM {{ ref('SRC2', 'part') }} `part`
