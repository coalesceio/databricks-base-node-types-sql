@id("bb35d26a-0e85-4f7b-9d89-935c85b865e5")
@nodeType("733")
@description("SCD1 dimension - change tracking, zero key, primary key, clustering, tags and tests")
@mergeStrategy("changeTracking")
@zeroKey("0", "'UNKNOWN'", "1900-01-01 00:00:00", false)
@tag("cost_center", "finance")
@tag("env", "dev")
@tests("SELECT `client_id` FROM {{ this }} GROUP BY `client_id` HAVING COUNT(*) > 1", false, "After")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_scd1_KEY` @id("f17c9d") @isSurrogateKey,
    `client_id`                          AS `client_id`            @id("dacbd6") @isBusinessKey @primaryKey(1) @not_null @uniqueness @description("Client business key"),
    `client_name`                        AS `client_name`          @id("cb12c6") @zeroKey("'N/A'"),
    `email`                              AS `email`                @id("27efc8") @empty,
    `region`                             AS `region`               @id("e1f944") @clusterKey(1),
    `update_time`                        AS `update_time`          @id("f46807") @freshness(30, "DAY"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`   @id("a0fc50") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`   @id("7b8bbd") @isSystemUpdateDate
FROM {{ ref('SRC', 'clients') }} `clients`