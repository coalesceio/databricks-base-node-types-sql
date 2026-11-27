@id("898de873-759c-438e-8ad7-810617bf3800")
@nodeType("SQLDimension")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_nation_test_KEY` @id("e0d87d") @isSurrogateKey,
    `Nation_Key`                             AS `Nation_Key`          @id("55f78f") @isBusinessKey,
    `Nation_Name`                            AS `Nation_Name`         @id("96a15f"),
    `Region_Key`                             AS `Region_Key`          @id("caabac"),
    `Nation_Comment`                         AS `Nation_Comment`      @id("d4a923"),
    1                                        AS `SYSTEM_VERSION`      @id("beab26") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG` @id("526e99") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`  @id("4bfff1") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`  @id("0945d0") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`     @id("80f154") @isSystemEndDate
FROM {{ ref('SRC', 'nation_test') }} `nation_test`
WHERE Nation_Key is not null