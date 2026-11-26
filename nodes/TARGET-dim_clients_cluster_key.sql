@id("b7e92ad5-9a33-445b-ac6c-0773ec92b784")
@nodeType("733")
@description("clusterKey - liquid clustering on region, client_id")
@mergeStrategy("changeTracking")
SELECT
    CAST(0 AS BIGINT)                    AS `dim_clients_cluster_key_KEY` @id("0e735c") @isSurrogateKey,
    `client_id`                          AS `client_id`                   @id("df06ea") @isBusinessKey,
    `client_name`                        AS `client_name`                 @id("a78730"),
    `email`                              AS `email`                       @id("a08064"),
    `region`                             AS `region`                      @id("9300d5") @clusterKey(1),
    `update_time`                        AS `update_time`                 @id("57b865"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_CREATE_DATE`          @id("182064") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS `SYSTEM_UPDATE_DATE`          @id("3b9de8") @isSystemUpdateDate
FROM {{ ref('TARGET', 'wrk_clients_base') }} `wrk_clients_base`
