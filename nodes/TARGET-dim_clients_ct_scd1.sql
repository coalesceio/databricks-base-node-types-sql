@id("2fb6b9f1-adf3-4e1a-9c86-7d9e25e6f119")
@nodeType("733")
@description("mergeStrategy changeTracking - SCD Type 1 (no isChangeTracking column)")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_ct_scd1_KEY` @id("d172bf") @isSurrogateKey,
    `client_id`                          AS `client_id`               @id("d8d6be") @isBusinessKey,
    `client_name`                        AS `client_name`             @id("340b3f") @isChangeTracking,
    `email`                              AS `email`                   @id("c20524"),
    `region`                             AS `region`                  @id("5174b8"),
    `update_time`                        AS `update_time`             @id("c6326e"),
    1                                        AS `SYSTEM_VERSION`          @id("855139") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`     @id("4e67eb") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`      @id("3ae5fc") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`      @id("08f0ce") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`         @id("a74f6b") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
