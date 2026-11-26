@id("b8185494-b1b6-4778-9d14-5a42071adcbe")
@nodeType("734")
@description("Fact - last modified comparison on update_time, partition by region")
@mergeStrategy("upsert")
SELECT
    `client_id`                          AS `client_id`          @id("36e3cc") @isBusinessKey,
    `client_name`                        AS `client_name`        @id("63bb50"),
    `email`                              AS `email`              @id("8a1dae"),
    `region`                             AS `region`             @id("db93d6") @partitionBy,
    `update_time`                        AS `update_time`        @id("953275"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("0e26b1") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("52c646") @isSystemUpdateDate
FROM {{ ref('SRC', 'clients') }} `clients`