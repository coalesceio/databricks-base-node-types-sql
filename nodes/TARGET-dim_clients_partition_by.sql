@id("cf9896a7-f4c8-4759-8b7e-f5220d7a5703")
@nodeType("733")
@description("Column-level partitionBy - table partitioned by region")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_partition_by_KEY` @id("964078") @isSurrogateKey,
    `client_id`                          AS `client_id`                    @id("dfc570") @isBusinessKey,
    `client_name`                        AS `client_name`                  @id("a1157a"),
    `email`                              AS `email`                        @id("8935ad"),
    `region`                             AS `region`                       @id("f73782"),
    `update_time`                        AS `update_time`                  @id("119746"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`           @id("ac7d99") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`           @id("350b1a") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
