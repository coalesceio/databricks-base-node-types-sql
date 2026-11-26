@id("563235c0-75b4-46f5-ab47-c641dc534a01")
@nodeType("SQLDimension")
@description("SCD pipeline - mergeStrategy changeTracking, SCD Type 1 (no isChangeTracking column, all attributes overwritten in place)")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_scd1_KEY` @id("303cd9") @isSurrogateKey,
    `client_id`                          AS `client_id`            @id("ee9e62") @isBusinessKey,
    `client_name`                        AS `client_name`          @id("28be06"),
    `email`                              AS `email`                @id("50340b"),
    `region`                             AS `region`               @id("49264c"),
    `update_time`                        AS `update_time`          @id("a91d1f"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`   @id("1e4e89") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`   @id("db5687") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_scd') }} `wrk_clients_scd`
