@id("a241a3b1-ad11-46e9-b123-eaabab143195")
@nodeType("SQLWork")
@description("Work table - client count per region, joined into fct_clients_join")
@writeMode("truncateInsert")
SELECT
    `region`           AS `region`           @id("faa00c") @not_null @uniqueness,
    COUNT(*)           AS `CLIENT_COUNT`     @id("519da2") @min_value("1"),
    MAX(`update_time`) AS `LAST_UPDATE_TIME` @id("cd8d97")
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
GROUP BY `region`
