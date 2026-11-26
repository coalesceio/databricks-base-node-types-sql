@id("f713756a-f9cb-4561-9697-0c9a224228ca")
@nodeType("733")
@description("materializationType view")
@materializationType("view")
SELECT
    `client_id`   AS `client_id`   @id("9db425") @isBusinessKey,
    `client_name` AS `client_name` @id("44f545"),
    `email`       AS `email`       @id("8e25a0"),
    `region`      AS `region`      @id("d4912c"),
    `update_time` AS `update_time` @id("146cf6")
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`