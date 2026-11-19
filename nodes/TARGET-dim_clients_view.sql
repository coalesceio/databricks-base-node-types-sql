@id("4cc58eea-e546-47a2-8950-3be6a6b34931")
@nodeType("733")
@description("Dimension materialized as a view")
@materializationType("view")
@tag("env", "dev")
SELECT
    `client_id`   AS `client_id`   @id("b43e66") @isBusinessKey,
    `client_name` AS `client_name` @id("94081e") @description("Client name"),
    `email`       AS `email`       @id("1c249c"),
    `region`      AS `region`      @id("1f3027")
FROM {{ ref('SRC', 'clients') }} `clients`