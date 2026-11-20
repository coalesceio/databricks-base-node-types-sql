@id("4c748c3c-fcaa-4829-993b-cb517924b5bb")
@nodeType("708")
@description("Work node materialized as a view")
@materializationType("view")
SELECT
    `client_id`          AS `client_id`   @id("f4b03d") @description("Client id"),
    UPPER(`client_name`) AS `client_name` @id("7f6521"),
    `email`              AS `email`       @id("990d74"),
    `region`             AS `region`      @id("ff9b2b")
FROM {{ ref('SRC', 'clients') }} `clients`