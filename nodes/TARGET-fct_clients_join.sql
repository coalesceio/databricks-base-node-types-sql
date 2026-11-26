@id("30e5a3d1-5a79-496c-ae59-125517f99920")
@nodeType("SQLFact")
@description("Join - clients joined to the region summary work node")
@mergeStrategy("changeTracking")
SELECT
    `wrk_clients_base`.`client_id`          AS `client_id`               @id("baab13") @isBusinessKey,
    `wrk_clients_base`.`client_name`        AS `client_name`             @id("bbc328"),
    `wrk_clients_base`.`email`              AS `email`                   @id("ac9d24"),
    `wrk_clients_base`.`region`             AS `region`                  @id("b24c3e"),
    `wrk_region_summary`.`CLIENT_COUNT`     AS `region_client_count`     @id("978ea7"),
    `wrk_region_summary`.`LAST_UPDATE_TIME` AS `region_last_update_time` @id("d4d9d9"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)    AS `SYSTEM_CREATE_DATE`      @id("cf356d") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)    AS `SYSTEM_UPDATE_DATE`      @id("82e911") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
INNER JOIN {{ ref('TARGET', 'wrk_region_summary') }} `wrk_region_summary`
    ON `wrk_clients_base`.`region` = `wrk_region_summary`.`region`
