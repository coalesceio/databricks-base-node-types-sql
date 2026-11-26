@id("912a3165-03c9-4b1d-848f-256a003aa0aa")
@nodeType("SQLFact")
@description("mergeStrategy allColumnMatch - factless fact, a client/region pair is inserted only when not already present")
@mergeStrategy("allColumnMatch")
SELECT
    `client_id`                          AS `client_id`          @id("dca350") @not_null,
    `region`                             AS `region`             @id("d511dc") @not_null,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("c9a958") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("5fbb8d") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
