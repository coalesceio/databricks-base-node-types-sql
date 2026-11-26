@id("97619590-64c6-45f7-8bf1-d29f8a7a0b17")
@nodeType("733")
@description("mergeStrategy upsert - matched rows updated, new rows inserted, no change detection")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_upsert_KEY` @id("be99ba") @isSurrogateKey,
    `client_id`                          AS `client_id`              @id("db3275") @isBusinessKey,
    `client_name`                        AS `client_name`            @id("e85652") @isChangeTracking,
    `email`                              AS `email`                  @id("9e539d"),
    `region`                             AS `region`                 @id("7f43e6"),
    `update_time`                        AS `update_time`            @id("fc7c7c"),
    1                                        AS `SYSTEM_VERSION`          @id("855139") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`     @id("4e67eb") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`      @id("3ae5fc") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`      @id("08f0ce") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`         @id("a74f6b") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
