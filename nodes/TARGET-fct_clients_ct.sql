@id("94c199f3-89c1-47d9-870e-2e8c69adf851")
@nodeType("734")
@description("Fact - change tracking (SCD1) with primary key, clustering, node and column tags, tests")
@mergeStrategy("changeTracking")
@tag("domain", "sales")
@tests("SELECT `client_id` FROM {{ this }} GROUP BY `client_id` HAVING COUNT(*) > 1", false, "After")
SELECT
    `client_id`                          AS `client_id`          @id("251feb") @isBusinessKey @primaryKey(1) @not_null @uniqueness,
    `client_name`                        AS `client_name`        @id("2348f0"),
    `email`                              AS `email`              @id("090db8") @tag("pii", "email"),
    `region`                             AS `region`             @id("6027b8") @clusterKey(1),
    `update_time`                        AS `update_time`        @id("abc2c2"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("f80fff") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("2124f1") @isSystemUpdateDate
FROM {{ ref('SRC', 'clients') }} `clients`