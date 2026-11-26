@id("468eff52-41d9-476f-8c5e-90685687cd1f")
@nodeType("SQLFact")
@description("writeMode append (explicit) - plain insert adds rows on every run")
@writeMode("append")
SELECT
    `client_id`                          AS `client_id`      @id("6b1a71") @not_null,
    `region`                             AS `region`         @id("be82db"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `LOAD_TIMESTAMP` @id("b28ba0")
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
