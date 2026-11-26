@id("4b45a7e8-7728-4ec5-88a9-245dbc463322")
@nodeType("SQLFact")
@description("inHash - CTE plus two hash groups built with get_hash (SHA256 and MD5)")
@mergeStrategy("changeTracking")
WITH `CLIENTS_CTE` AS (
    SELECT *
    FROM {{ ref('TARGET', 'wrk_clients_base') }}
)
SELECT
    `client_id`                                             AS `client_id`          @id("232ca5") @isBusinessKey @inHash("CLIENT_HASH", 1),
    `client_name`                                           AS `client_name`        @id("6536c5") @inHash("CLIENT_HASH", 2),
    `email`                                                 AS `email`              @id("670cd4") @inHash("CLIENT_HASH", 3) @inHash("CONTACT_HASH", 1),
    `region`                                                AS `region`             @id("a92031") @inHash("CONTACT_HASH", 2),
    `update_time`                                           AS `update_time`        @id("4b38be"),
    CAST({{ get_hash('CLIENT_HASH', 'SHA256') }} AS STRING) AS `CLIENT_HASH`        @id("86cda8"),
    CAST({{ get_hash('CONTACT_HASH', 'MD5') }} AS STRING)   AS `CONTACT_HASH`       @id("316101"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                    AS `SYSTEM_CREATE_DATE` @id("38e48f") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                    AS `SYSTEM_UPDATE_DATE` @id("b0793b") @isSystemUpdateDate
FROM `CLIENTS_CTE` `wrk_clients_base`
