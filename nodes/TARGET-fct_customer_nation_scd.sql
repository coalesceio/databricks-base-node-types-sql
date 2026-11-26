@id("b4248100-bb3b-4c78-b782-6478d5ec4cc9")
@nodeType("SQLFact")
@description("SCD pipeline - customer fact (SRC2.customer) keyed to the current row of each nation SCD1/SCD2/LM SCD1/LM SCD2 dimension")
@mergeStrategy("changeTracking")
SELECT
    `customer`.`c_custkey`                         AS `c_custkey`              @id("0a2b38") @isBusinessKey,
    `customer`.`c_nationkey`                       AS `c_nationkey`            @id("294d93"),
    `dim_nation_scd1`.`dim_nation_scd1_KEY`        AS `dim_nation_scd1_KEY`    @id("23d5a7"),
    `dim_nation_scd2`.`dim_nation_scd2_KEY`        AS `dim_nation_scd2_KEY`    @id("bef79c"),
    `dim_nation_lm_scd1`.`dim_nation_lm_scd1_KEY`  AS `dim_nation_lm_scd1_KEY` @id("26ec61"),
    `dim_nation_lm_scd2`.`dim_nation_lm_scd2_KEY`  AS `dim_nation_lm_scd2_KEY` @id("12c5b9"),
    `customer`.`c_mktsegment`                      AS `c_mktsegment`           @id("488e0b"),
    `customer`.`c_acctbal`                         AS `c_acctbal`              @id("583a83"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)           AS `SYSTEM_CREATE_DATE`     @id("437a37") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)           AS `SYSTEM_UPDATE_DATE`     @id("394a54") @isSystemUpdateDate
FROM {{ ref('SRC2', 'customer') }} `customer`
LEFT JOIN {{ ref('TARGET', 'dim_nation_scd1') }} `dim_nation_scd1`
    ON `customer`.`c_nationkey` = `dim_nation_scd1`.`n_nationkey`
LEFT JOIN {{ ref('TARGET', 'dim_nation_scd2') }} `dim_nation_scd2`
    ON  `customer`.`c_nationkey` = `dim_nation_scd2`.`n_nationkey`
    AND `dim_nation_scd2`.`SYSTEM_CURRENT_FLAG` = 'Y'
LEFT JOIN {{ ref('TARGET', 'dim_nation_lm_scd1') }} `dim_nation_lm_scd1`
    ON `customer`.`c_nationkey` = `dim_nation_lm_scd1`.`n_nationkey`
LEFT JOIN {{ ref('TARGET', 'dim_nation_lm_scd2') }} `dim_nation_lm_scd2`
    ON  `customer`.`c_nationkey` = `dim_nation_lm_scd2`.`n_nationkey`
    AND `dim_nation_lm_scd2`.`SYSTEM_CURRENT_FLAG` = 'Y'
