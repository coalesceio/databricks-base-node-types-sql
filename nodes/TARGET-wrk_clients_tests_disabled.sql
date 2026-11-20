@id("edcf8485-3c9a-4740-92f7-83066799e105")
@nodeType("708")
@description("Work table - tests configured but skipped with @disableTests")
@disableTests
@tests("SELECT 1", false, "Before")
SELECT
    `client_id`   AS `client_id`   @id("a81bce") @not_null @uniqueness,
    `client_name` AS `client_name` @id("3d5a12"),
    `region`      AS `region`      @id("665b4e") @accepted_values("'NORTH'") @accepted_values("'SOUTH'"),
    `update_time` AS `update_time` @id("566424") @min_value("TIMESTAMP '2000-01-01'")
FROM {{ ref('SRC', 'clients') }} `clients`