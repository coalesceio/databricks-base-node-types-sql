@id("65706d53-b634-431e-8f34-65acd48bb0c8")
@nodeType("733")
@description("disableTests - every node and column test on this node is skipped")
@mergeStrategy("lastModified")
@disableTests(true)
@tests("SELECT 1 AS `SHOULD_BE_SKIPPED`", true, "After")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_disable_tests_KEY` @id("289c8e") @isSurrogateKey,
    `client_id`                          AS `client_id`                     @id("a44d9e") @isBusinessKey @not_null,
    `client_name`                        AS `client_name`                   @id("add625") @empty,
    `email`                              AS `email`                         @id("75f46e"),
    `region`                             AS `region`                        @id("d72da5"),
    `update_time`                        AS `update_time`                   @id("5aa8eb") @lastModifiedTracking(1),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`            @id("ac72ce") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`            @id("5c5598") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
