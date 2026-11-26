@id("cddfdb7c-9ccf-4f32-8a3a-b3d210720a01")
@nodeType("SQLDimension")
@description("SCD pipeline - mergeStrategy lastModified, SCD Type 1 on update_time")
@mergeStrategy("lastModified")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_lm_scd1_KEY` @id("509f9d") @isSurrogateKey,
    `client_id`                          AS `client_id`               @id("38a1d2") @isBusinessKey,
    `client_name`                        AS `client_name`             @id("4a83f1"),
    `email`                              AS `email`                   @id("84ae01"),
    `region`                             AS `region`                  @id("39809c"),
    `update_time`                        AS `update_time`             @id("4b7603") @lastModifiedTracking(1),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`      @id("485e10") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`      @id("21663b") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_scd') }} `wrk_clients_scd`
