@id("bffac038-24b2-45c5-8f71-c9b984ef1e4f")
@nodeType("733")
@description("Join - clients joined to the region summary work node")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                       AS `dim_clients_join_KEY`    @id("907401") @isSurrogateKey,
    `wrk_clients_base`.`client_id`          AS `client_id`               @id("d39968") @isBusinessKey,
    `wrk_clients_base`.`client_name`        AS `client_name`             @id("c987f0"),
    `wrk_clients_base`.`email`              AS `email`                   @id("78cb94"),
    `wrk_clients_base`.`region`             AS `region`                  @id("3de718"),
    `wrk_region_summary`.`CLIENT_COUNT`     AS `region_client_count`     @id("07df39"),
    `wrk_region_summary`.`LAST_UPDATE_TIME` AS `region_last_update_time` @id("b0f720"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)    AS `SYSTEM_CREATE_DATE`      @id("e73f86") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)    AS `SYSTEM_UPDATE_DATE`      @id("e6c682") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
INNER JOIN {{ ref('TARGET', 'wrk_region_summary') }} `wrk_region_summary`
    ON `wrk_clients_base`.`region` = `wrk_region_summary`.`region`
