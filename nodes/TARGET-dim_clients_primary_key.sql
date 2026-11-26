@id("c124688c-23d6-4496-96ad-1da6b5065724")
@nodeType("733")
@description("primaryKey - informational PRIMARY KEY on client_id, paired with not_null and uniqueness tests")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_primary_key_KEY` @id("9f0e51") @isSurrogateKey,
    `client_id`                          AS `client_id`                   @id("2289c3") @isBusinessKey @not_null @uniqueness,
    `client_name`                        AS `client_name`                 @id("558df4"),
    `email`                              AS `email`                       @id("f8ee74"),
    `region`                             AS `region`                      @id("5faff9"),
    `update_time`                        AS `update_time`                 @id("ce0d63"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`          @id("8823cd") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`          @id("b6585d") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
