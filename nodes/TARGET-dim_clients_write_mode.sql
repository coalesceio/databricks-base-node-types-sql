@id("0f4d1685-d406-4f8f-8068-3f0468ce638b")
@nodeType("733")
@description("writeMode append")
@mergeStrategy("changeTracking")
@writeMode("append")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_write_mode_KEY` @id("16fc5c") @isSurrogateKey,
    `client_id`                          AS `client_id`                  @id("a6c786") @isBusinessKey,
    `client_name`                        AS `client_name`                @id("3c12ca"),
    `email`                              AS `email`                      @id("9559ce"),
    `region`                             AS `region`                     @id("9f2f6c"),
    `update_time`                        AS `update_time`                @id("365e62"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`         @id("61e1f8") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`         @id("de6a88") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
