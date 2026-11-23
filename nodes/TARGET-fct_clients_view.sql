@id("957aa5bb-4957-42a2-b7c0-47d52aaccdfd")
@nodeType("734")
@description("Fact materialized as a view")
@materializationType("view")
@tag("domain", "sales")
SELECT
    `client_id`   AS `client_id`   @id("cca2e2") @isBusinessKey,
    `region`      AS `region`      @id("03c18c"),
    `update_time` AS `update_time` @id("69bba0")
FROM {{ ref('SRC', 'clients') }} `clients`