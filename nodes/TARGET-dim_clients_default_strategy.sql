@id("7f6a2ef6-dd5e-4c23-9c20-e9056537ae4a")
@nodeType("733")
@description("No mergeStrategy annotation - defaults to changeTracking SCD Type 1")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_default_strategy_KEY` @id("92f976") @isSurrogateKey,
    `client_id`                          AS `client_id`                        @id("32fd47") @isBusinessKey,
    `client_name`                        AS `client_name`                      @id("acdd77"),
    `email`                              AS `email`                            @id("0f288e"),
    `region`                             AS `region`                           @id("ce68c1"),
    `update_time`                        AS `update_time`                      @id("b5b50d"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`               @id("9f543e") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`               @id("9c80ff") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
