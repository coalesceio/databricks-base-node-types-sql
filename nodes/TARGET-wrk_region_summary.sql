@id("68dbdc92-d62b-4668-b1a1-40fb7e92db65")
@nodeType("708")
@description("Work table - client count per region, joined into dim_clients_join")
@writeMode("truncateInsert")
SELECT
    `region`           AS `region`           @id("f46c55") @not_null @uniqueness,
    COUNT(*)           AS `CLIENT_COUNT`     @id("6b4e89") @min_value("1"),
    MAX(`update_time`) AS `LAST_UPDATE_TIME` @id("e38caf")
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
GROUP BY `region`
