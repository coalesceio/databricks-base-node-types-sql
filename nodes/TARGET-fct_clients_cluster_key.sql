@id("9b45e8ff-a528-4d7f-8319-ef9d6d5dba16")
@nodeType("SQLFact")
@description("clusterKey - liquid clustering on region, client_id")
@mergeStrategy("changeTracking")
SELECT
    `client_id`                          AS `client_id`          @id("2f1ab9") @isBusinessKey @clusterKey(2),
    `client_name`                        AS `client_name`        @id("999eac"),
    `email`                              AS `email`              @id("856bf2"),
    `region`                             AS `region`             @id("8fe387") @clusterKey(1),
    `update_time`                        AS `update_time`        @id("831137"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE` @id("24b31f") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE` @id("0aa2b1") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
