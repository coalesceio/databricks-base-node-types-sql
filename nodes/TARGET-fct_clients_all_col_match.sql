@id("6b9d5def-1dc5-4f8a-a78f-880dfdbebfcc")
@nodeType("734")
@mergeStrategy("allColumnMatch")
SELECT
    `client_id`                          AS `client_id`          @id("ca4915") @not_null,
    `region`                             AS `region`             @id("ab694a") @not_null,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("296bd2") @isSystemCreateDate
FROM {{ ref('SRC', 'clients') }} `clients`