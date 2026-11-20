@id("d7b271b0-2821-42d0-9607-ac8fd7700398")
@nodeType("708")
@description("Work table - aggregate per region with min_max test")
@writeMode("truncateInsert")
SELECT
    `region`           AS `region`           @id("d4dae7") @not_null,
    COUNT(*)           AS `CLIENT_COUNT`     @id("201a31") @min_max("1", "1000000"),
    MAX(`update_time`) AS `LAST_UPDATE_TIME` @id("9d6a08")
FROM {{ ref('SRC', 'clients') }} `clients`
GROUP BY `region`