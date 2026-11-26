@id("047be13f-f786-40ce-8955-1e3af2784341")
@nodeType("SQLDimension")
@description("SCD pipeline - mergeStrategy changeTracking, SCD Type 2 on email and region (isChangeTracking)")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_clients_scd2_KEY` @id("166f1b") @isSurrogateKey,
    `client_id`                              AS `client_id`            @id("27f4f3") @isBusinessKey,
    `client_name`                            AS `client_name`          @id("3fda45"),
    `email`                                  AS `email`                @id("2a48e2") @isChangeTracking,
    `region`                                 AS `region`               @id("7bbbf9") @isChangeTracking,
    `update_time`                            AS `update_time`          @id("d68aef"),
    1                                        AS `SYSTEM_VERSION`       @id("236983") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`  @id("b7d2f6") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`   @id("ac1fa3") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`   @id("ef9a65") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`      @id("0d13d4") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_clients_scd') }} `wrk_clients_scd`
