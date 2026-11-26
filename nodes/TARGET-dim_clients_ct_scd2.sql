@id("c3faf999-2545-4ed1-a48f-36939f8e36f2")
@nodeType("733")
@description("mergeStrategy changeTracking - SCD Type 2 on email and region")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_clients_ct_scd2_KEY` @id("43164b") @isSurrogateKey,
    `client_id`                              AS `client_id`               @id("771412") @isBusinessKey,
    `client_name`                            AS `client_name`             @id("8e1fb9"),
    `email`                                  AS `email`                   @id("fef0fa"),
    `region`                                 AS `region`                  @id("bbd27b"),
    `update_time`                            AS `update_time`             @id("b7136c"),
    1                                        AS `SYSTEM_VERSION`          @id("855139") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`     @id("4e67eb") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`      @id("3ae5fc") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`      @id("08f0ce") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`         @id("a74f6b") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
