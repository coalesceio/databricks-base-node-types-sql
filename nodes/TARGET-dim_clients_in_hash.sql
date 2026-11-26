@id("d9fa66b0-db4c-43c6-a8b0-b652aa7f230d")
@nodeType("733")
@description("inHash - CTE plus two hash groups built with get_hash (SHA256 and MD5)")
@mergeStrategy("changeTracking")
WITH `CLIENTS_CTE` AS (
    SELECT *
    FROM {{ ref('TARGET', 'wrk_clients_base') }}
)
SELECT
    CAST(0 AS BIGINT)                                       AS `dim_clients_in_hash_KEY` @id("048b0b") @isSurrogateKey,
    `client_id`                                             AS `client_id`               @id("4f165e") @isBusinessKey @inHash("CLIENT_HASH", 1),
    `client_name`                                           AS `client_name`             @id("b17e84") @inHash("CLIENT_HASH", 2),
    `email`                                                 AS `email`                   @id("4807e8") @inHash("CLIENT_HASH", 3) @inHash("CONTACT_HASH", 1),
    `region`                                                AS `region`                  @id("557e1c") @inHash("CONTACT_HASH", 2),
    `update_time`                                           AS `update_time`             @id("650a35"),
    CAST({{ get_hash('CLIENT_HASH', 'SHA256') }} AS STRING) AS `CLIENT_HASH`             @id("867022"),
    CAST({{ get_hash('CONTACT_HASH', 'MD5') }} AS STRING)   AS `CONTACT_HASH`            @id("1976ab"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                    AS `SYSTEM_CREATE_DATE`      @id("280a4c") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                    AS `SYSTEM_UPDATE_DATE`      @id("641267") @isSystemUpdateDate
FROM `CLIENTS_CTE` `wrk_clients_base`
