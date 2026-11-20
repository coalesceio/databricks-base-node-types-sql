@id("e0b6eed6-d07a-449c-95ed-e5ad40ffd782")
@nodeType("708")
@description("Work table - truncateInsert (default write mode) with column and node tests")
@writeMode("truncateInsert")
@tests("SELECT `client_id` FROM {{ this }} GROUP BY `client_id` HAVING COUNT(*) > 1", true, "After")
SELECT
    `client_id`                          AS `client_id`      @id("8bea2e") @not_null @uniqueness @description("Client id"),
    `client_name`                        AS `client_name`    @id("a171b7") @empty,
    `email`                              AS `email`          @id("09b05a"),
    `region`                             AS `region`         @id("930e5f") @rejected_values("'UNKNOWN'"),
    `update_time`                        AS `update_time`    @id("01bb34") @freshness(30, "DAY"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `LOAD_TIMESTAMP` @id("3a7d4d") @relative_time(">=", "update_time")
FROM {{ ref('SRC', 'clients') }} `clients`