@id("0fbd2d89-cb3b-48bb-aa83-caef0fef3a6a")
@nodeType("733")
@description("zeroKey - zero key record with every node-level parameter, plus a column-level override")
@mergeStrategy("changeTracking")
@zeroKey("-1", "'UNKNOWN'", "1900-01-01 00:00:00", false)
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_zero_key_KEY` @id("409883") @isSurrogateKey,
    `client_id`                          AS `client_id`                @id("a5e588") @isBusinessKey,
    `client_name`                        AS `client_name`              @id("614fe4") @zeroKey("'N/A'"),
    `email`                              AS `email`                    @id("e4b071"),
    `region`                             AS `region`                   @id("a13778"),
    `update_time`                        AS `update_time`              @id("9d2737"),
    CAST(`update_time` AS DATE)          AS `update_date`              @id("a5dca6"),
    CAST(TRUE AS BOOLEAN)                AS `is_active`                @id("e1b4a2"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`       @id("59b6ba") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`       @id("a20cc1") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
