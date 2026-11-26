@id("8af32c6c-edbb-4bb5-aeb4-df3df4ddead2")
@nodeType("733")
@description("SCD1 dimension - last modified comparison, partition by region")
@mergeStrategy("lastModified")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_scd1_lm_KEY` @id("fa3509") @isSurrogateKey,
    `client_id`                          AS `client_id`               @id("d6b5de") @isBusinessKey,
    `client_name`                        AS `client_name`             @id("2d87da"),
    `email`                              AS `email`                   @id("d3d9f3"),
    `region`                             AS `region`                  @id("4d3ca5") @accepted_values("'NORTH'") @accepted_values("'SOUTH'") @accepted_values("'EAST'") @accepted_values("'WEST'"),
    `update_time`                        AS `update_time`             @id("30e3ad") @lastModifiedTracking(1),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`      @id("f0ded3") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`      @id("01e79a") @isSystemUpdateDate
FROM {{ ref('SRC', 'clients') }} `clients`