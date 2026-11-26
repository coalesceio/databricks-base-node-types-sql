@id("b4248100-bb3b-4c78-b782-6478d5ec4cc9")
@nodeType("SQLFact")
@description("SCD pipeline - fact joining the work node to the current row of each SCD1/SCD2/LM SCD1/LM SCD2 dimension")
@mergeStrategy("changeTracking")
SELECT
    `wrk_clients_scd`.`client_id`                   AS `client_id`               @id("0a2b38") @isBusinessKey,
    `dim_clients_scd1`.`dim_clients_scd1_KEY`       AS `dim_clients_scd1_KEY`    @id("23d5a7"),
    `dim_clients_scd2`.`dim_clients_scd2_KEY`       AS `dim_clients_scd2_KEY`    @id("bef79c"),
    `dim_clients_lm_scd1`.`dim_clients_lm_scd1_KEY` AS `dim_clients_lm_scd1_KEY` @id("26ec61"),
    `dim_clients_lm_scd2`.`dim_clients_lm_scd2_KEY` AS `dim_clients_lm_scd2_KEY` @id("12c5b9"),
    `wrk_clients_scd`.`region`                      AS `region`                  @id("488e0b"),
    `wrk_clients_scd`.`update_time`                 AS `update_time`             @id("583a83"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)            AS `SYSTEM_CREATE_DATE`      @id("437a37") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)            AS `SYSTEM_UPDATE_DATE`      @id("394a54") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_scd') }} `wrk_clients_scd`
LEFT JOIN {{ ref('TARGET', 'dim_clients_scd1') }} `dim_clients_scd1`
    ON `wrk_clients_scd`.`client_id` = `dim_clients_scd1`.`client_id`
LEFT JOIN {{ ref('TARGET', 'dim_clients_scd2') }} `dim_clients_scd2`
    ON  `wrk_clients_scd`.`client_id` = `dim_clients_scd2`.`client_id`
    AND `dim_clients_scd2`.`SYSTEM_CURRENT_FLAG` = 'Y'
LEFT JOIN {{ ref('TARGET', 'dim_clients_lm_scd1') }} `dim_clients_lm_scd1`
    ON `wrk_clients_scd`.`client_id` = `dim_clients_lm_scd1`.`client_id`
LEFT JOIN {{ ref('TARGET', 'dim_clients_lm_scd2') }} `dim_clients_lm_scd2`
    ON  `wrk_clients_scd`.`client_id` = `dim_clients_lm_scd2`.`client_id`
    AND `dim_clients_lm_scd2`.`SYSTEM_CURRENT_FLAG` = 'Y'
