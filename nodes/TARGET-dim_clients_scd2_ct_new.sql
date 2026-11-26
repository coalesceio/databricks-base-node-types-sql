@id("bfcf1d00-8ca7-466d-8599-999aa2a36003")
@nodeType("733")
@description("SCD2 dimension - change tracking on email and region")
@mergeStrategy("changeTracking")
@zeroKey("0")
@tests("SELECT `client_id` FROM {{ this }} WHERE `SYSTEM_CURRENT_FLAG` = 'Y' GROUP BY `client_id` HAVING COUNT(*) > 1", false, "After")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_clients_scd2_ct_KEY` @id("07faad") @isSurrogateKey @primaryKey(1),
    `client_id`                              AS `client_id`               @id("1f0413") @isBusinessKey @not_null,
    `client_name`                            AS `client_name`             @id("c5a049"),
    `email`                                  AS `email`                   @id("2e5b9e") @isChangeTracking,
    `region`                                 AS `region`                  @id("dca128") @isChangeTracking @clusterKey(1),
    `update_time`                            AS `update_time`             @id("4c2da7"),
    1                                        AS `SYSTEM_VERSION`          @id("342fa6") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`     @id("0d0ba2") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`      @id("53be86") @isSystemCreateDate @relative_time("<=", "SYSTEM_END_DATE"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`      @id("97874f") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`         @id("7e0754") @isSystemEndDate
FROM {{ ref('SRC', 'clients') }} `clients`