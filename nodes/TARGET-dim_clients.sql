@id("9534a36b-ec5a-4a67-9b1e-40b8ee6d6db7")
@nodeType("733")
@mergeStrategy("lastModified")
SELECT
    CAST(0 AS BIGINT)                        AS `dim_clients_KEY`     @id("7a050b") @isSurrogateKey,
    `client_id`                              AS `client_id`           @id("a67793") @isBusinessKey,
    `client_name`                            AS `client_name`         @id("2d9e70"),
    `email`                                  AS `email`               @id("dc5b5e"),
    `region`                                 AS `region`              @id("36fc76"),
    `update_time`                            AS `update_time`         @id("dca194") @lastModifiedTracking(1),
    1                                        AS `SYSTEM_VERSION`      @id("557e46") @isSystemVersion,
    CAST('Y' AS STRING)                      AS `SYSTEM_CURRENT_FLAG` @id("f95d68") @isSystemCurrentFlag,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_CREATE_DATE`  @id("2a3c73") @isSystemCreateDate,
    CAST(CURRENT_TIMESTAMP AS TIMESTAMP)     AS `SYSTEM_UPDATE_DATE`  @id("83ad6a") @isSystemUpdateDate,
    CAST('2999-12-31 00:00:00' AS TIMESTAMP) AS `SYSTEM_END_DATE`     @id("9f5886") @isSystemEndDate
FROM {{ ref('SRC', 'clients') }} `clients`