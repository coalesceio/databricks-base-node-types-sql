@id("6f153510-6b41-4078-92f2-669f81026015")
@nodeType("733")
@description("mergeStrategy lastModified - SCD Type 1 on update_time")
@mergeStrategy("lastModified")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_lm_scd1_KEY` @id("7dc770") @isSurrogateKey,
    `client_id`                          AS `client_id`               @id("d8b347") @isBusinessKey,
    `client_name`                        AS `client_name`             @id("32c4ea"),
    `email`                              AS `email`                   @id("5819a3"),
    `region`                             AS `region`                  @id("42d682"),
    `update_time`                        AS `update_time`             @id("2cc745") @lastModifiedTracking(1),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`      @id("341fea") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`      @id("dd9736") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
