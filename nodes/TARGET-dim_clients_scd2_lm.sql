@id("4c25c058-c381-4d3f-b0ef-2eb744a12ce6")
@nodeType("733")
@description("SCD2 dimension - last modified comparison on update_time, partitioned by load date")
@mergeStrategy("lastModified")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_clients_scd2_lm_KEY` @id("a2ab4d") @isSurrogateKey,
    `client_id`                              AS `client_id`               @id("f0a792") @isBusinessKey,
    `client_name`                            AS `client_name`             @id("167fb3"),
    `email`                                  AS `email`                   @id("54fb92"),
    `region`                                 AS `region`                  @id("4011af"),
    `update_time`                            AS `update_time`             @id("cb39c3") @lastModifiedTracking(2),
    CAST(`update_time` AS DATE)              AS `LOAD_DATE`               @id("aba5ac") @partitionBy,
    1                                        AS `SYSTEM_VERSION`          @id("37abdf") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`     @id("d861a5") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`      @id("ef71f4") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`      @id("b13176") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`         @id("614818") @isSystemEndDate
FROM {{ ref('SRC', 'clients') }} `clients`