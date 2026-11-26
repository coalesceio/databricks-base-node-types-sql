@id("4034a941-5178-4818-aa39-6ce72915a6e2")
@nodeType("734")
@description("Fact - plain insert (no business key, no mergeStrategy), append write mode")
@writeMode("append")
@mergeStrategy("changeTracking")
SELECT
    `client_id`                          AS `client_id`      @id("01ea37") @not_null @isBusinessKey,
    `region`                             AS `region`         @id("72853d"),
    `update_time`                        AS `update_time`    @id("200ea9"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `LOAD_TIMESTAMP` @id("159502")
FROM {{ ref('SRC', 'clients') }} `clients`