@id("74e1a4c5-e3e8-46cc-bb80-6993b4a95ae4")
@nodeType("733")
@description("mergeStrategy lastModified - SCD Type 2 on update_time")
@mergeStrategy("lastModified")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_clients_lm_scd2_KEY` @id("7ae673") @isSurrogateKey,
    `client_id`                              AS `client_id`               @id("fcf87a") @isBusinessKey,
    `client_name`                            AS `client_name`             @id("775813"),
    `email`                                  AS `email`                   @id("5f79f4"),
    `region`                                 AS `region`                  @id("eaec02"),
    `update_time`                            AS `update_time`             @id("17da60") @lastModifiedTracking(2),
    1                                        AS `SYSTEM_VERSION`          @id("0f612b") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`     @id("7fc9ae") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`      @id("752bb1") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`      @id("4e5b9d") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`         @id("42ee64") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
