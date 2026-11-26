@id("05f67354-de1e-4a85-a238-4f13504cdc90")
@nodeType("733")
@description("Dimension using every node and column annotation once")
@materializationType("table")
@disableTests
@tag("cost_center", "finance")
@writeMode("truncateInsert")
@mergeStrategy("changeTracking")
@zeroKey("0", "'UNKNOWN'", "1900-01-01 00:00:00", false)

@tests("SELECT `client_id` FROM {{ this }} WHERE `SYSTEM_CURRENT_FLAG` = 'Y' GROUP BY `client_id` HAVING COUNT(*) > 1", true, "After")
@preSQL("SELECT 1")
@postSQL("SELECT 1")
SELECT
    CAST(0 AS BIGINT)                                       AS `dim_clients_all_annotations_KEY` @id("cd2932") @isSurrogateKey @max_value("1000000"),
    `client_id`                                             AS `client_id`                       @id("8e171c") @notNull @isBusinessKey @primaryKey(1) @not_null @uniqueness @min_max("0", "100000") @inHash("CLIENT_HASH", 1) @description("Client business key"),
    `client_name`                                           AS `client_name`                     @id("5fa059") @zeroKey("'N/A'") 
    @tag("pii", "name") @empty @rejected_values("'TEST'"),
    `email`                                                 AS `email`                           @id("fb3b45") @isChangeTracking @inHash("CLIENT_HASH", 2),
    `region`                                                AS `region`                          @id("dfc106") @accepted_values("'Tokyo'"),
    `update_time`                                           AS `update_time`                     @id("b9e007")  @freshness(30, "DAY"),
    CAST(`update_time` AS DATE)                             AS `LOAD_DATE`                       @id("6645a8") ,
    CAST({{ get_hash('CLIENT_HASH', 'SHA256') }} AS STRING) AS `CLIENT_HASH`                     @id("1680b9"),
    1                                                       AS `SYSTEM_VERSION`                  @id("3667e1") @isSystemVersion @min_value("1"),
    CAST('Y' AS STRING)                                     AS `SYSTEM_CURRENT_FLAG`             @id("d82f5c") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                    AS `SYSTEM_CREATE_DATE`              @id("37b887") @isSystemCreateDate @relative_time("<=", "SYSTEM_END_DATE"),
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)                    AS `SYSTEM_UPDATE_DATE`              @id("e07bfd") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP)                AS `SYSTEM_END_DATE`                 @id("c32fd6") @isSystemEndDate
FROM {{ ref('SRC', 'clients') }} `clients`
