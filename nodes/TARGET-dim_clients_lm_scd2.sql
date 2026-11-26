@id("078d840e-7bdc-42f4-b7ec-bf385a9d2f34")
@nodeType("SQLDimension")
@description("SCD pipeline - mergeStrategy lastModified, SCD Type 2 on update_time")
@mergeStrategy("lastModified")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_clients_lm_scd2_KEY` @id("016489") @isSurrogateKey,
    `client_id`                              AS `client_id`               @id("3b01da") @isBusinessKey,
    `client_name`                            AS `client_name`             @id("4c85f3"),
    `email`                                  AS `email`                   @id("602cd5"),
    `region`                                 AS `region`                  @id("4abb34"),
    `update_time`                            AS `update_time`             @id("47c73b") @lastModifiedTracking(2),
    1                                        AS `SYSTEM_VERSION`          @id("23c69f") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`     @id("302186") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`      @id("1c06b1") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`      @id("f6d0ce") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`         @id("caeae2") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_clients_scd') }} `wrk_clients_scd`
