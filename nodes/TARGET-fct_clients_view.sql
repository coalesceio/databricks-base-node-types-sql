@id("d1fc32f7-0660-4200-84e2-6743518f11bd")
@nodeType("SQLFact")
@description("materializationType view - fact created as a view, with a node-level tag")
@materializationType("view")
@tag("env", "dev")
SELECT
    `client_id`   AS `client_id`   @id("1f70b3") @description("Client id"),
    `client_name` AS `client_name` @id("bde5ff") @description("Client name"),
    `email`       AS `email`       @id("0982ae"),
    `region`      AS `region`      @id("0355ae"),
    `update_time` AS `update_time` @id("0bfb5f")
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
