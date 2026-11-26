@id("6f304483-42fc-4581-b847-b236fdadb708")
@nodeType("SQLFact")
@description("No business key and no mergeStrategy - plain insert (append)")
SELECT
    `client_id`                          AS `client_id`      @id("ebc268") @not_null,
    `region`                             AS `region`         @id("540d90"),
    `update_time`                        AS `update_time`    @id("d1b88b"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `LOAD_TIMESTAMP` @id("1650b6")
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
