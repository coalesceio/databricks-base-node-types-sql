@id("9c387d67-0f72-491b-8061-319b12641d61")
@nodeType("SQLFact")
@description("disableTests - every node and column test on this node is skipped")
@mergeStrategy("changeTracking")
@disableTests
@tests("SELECT 1 AS `SHOULD_BE_SKIPPED`", true, "After")
SELECT
    `client_id`                          AS `client_id`          @id("567a01") @isBusinessKey @not_null,
    `client_name`                        AS `client_name`        @id("5daf52") @empty,
    `email`                              AS `email`              @id("edbf3c"),
    `region`                             AS `region`             @id("58433a"),
    `update_time`                        AS `update_time`        @id("2f65db"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("d74a4b") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("957739") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
