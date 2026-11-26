@id("d0afcab8-c686-4b3f-9340-25f448c855af")
@nodeType("733")
@description("preSQL / postSQL - two pre-load statements and one post-load statement")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_pre_post_sql_KEY` @id("7c69ce") @isSurrogateKey,
    `client_id`                          AS `client_id`                    @id("c9df68") @isBusinessKey,
    `client_name`                        AS `client_name`                  @id("b84c19"),
    `email`                              AS `email`                        @id("3774e9"),
    `region`                             AS `region`                       @id("58a339"),
    `update_time`                        AS `update_time`                  @id("9be1e2"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`           @id("af6215") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`           @id("9d2d63") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
