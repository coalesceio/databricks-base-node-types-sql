@id("44fd920a-0411-47cd-8127-b76bcb9db0d8")
@nodeType("733")
@description("materializationType view - dimension created as a view, with a node-level tag")
@materializationType("view")
@tag("env", "dev")
SELECT
    `client_id`   AS `client_id`   @id("dd12cb") @isBusinessKey @description("Client id"),
    `client_name` AS `client_name` @id("162cdd") @description("Client name"),
    `email`       AS `email`       @id("69422f"),
    `region`      AS `region`      @id("3ee4b0"),
    `update_time` AS `update_time` @id("6af785")
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
