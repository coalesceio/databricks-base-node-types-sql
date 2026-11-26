@id("44fd920a-0411-47cd-8127-b76bcb9db0d8")
@nodeType("733")
@description("materializationType view - dimension created as a view, with a node-level tag")
@materializationType("table")
@tag("env", "dev")
SELECT
    CAST(0 AS BIGINT)              AS `dim_clients_view` @id("d172bf") @isSurrogateKey,
    `client_id`   AS `client_id`   @id("dd12cb")  @isBusinessKey @description("Client id"),
    `client_name` AS `client_name` @id("162cdd") @description("Client name"),
    `email`       AS `email`       @id("69422f"),
    `region`      AS `region`      @id("3ee4b0"),
    `update_time` AS `update_time` @id("6af785"),
    1                                        AS `SYSTEM_VERSION`          @id("855139") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG`     @id("4e67eb") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`      @id("3ae5fc") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`      @id("08f0ce") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`         @id("a74f6b") @isSystemEndDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
