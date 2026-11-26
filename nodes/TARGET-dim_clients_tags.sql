@id("bf14275e-3a4c-4556-82a9-303ed0a851aa")
@nodeType("733")
@description("tag - node-level tags on the table and a column-level tag on email")
@mergeStrategy("changeTracking")
@tag("cost_center", "finance")
@tag("env", "dev")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_tags_KEY` @id("7d6b4e") @isSurrogateKey,
    `client_id`                          AS `client_id`            @id("33af52") @isBusinessKey,
    `client_name`                        AS `client_name`          @id("389e4e"),
    `email`                              AS `email`                @id("339ebc") @tag("pii", "email"),
    `region`                             AS `region`               @id("349eaf"),
    `update_time`                        AS `update_time`          @id("cf095b"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`   @id("65cb83") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`   @id("79df08") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
