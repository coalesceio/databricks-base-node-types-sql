@id("92fbe413-e2fb-4897-98c1-5b8fee8eec52")
@nodeType("SQLWork")
@description("Work table - cleaned clients, one row per client_id (latest update_time). Source for the fact test nodes")
@writeMode("truncateInsert")
WITH `LATEST_CLIENTS` AS (
    SELECT *
    FROM {{ ref('SRC', 'clients') }}
    WHERE `client_id` IS NOT NULL
    QUALIFY ROW_NUMBER() OVER (PARTITION BY `client_id` ORDER BY `update_time` DESC NULLS LAST) = 1
)
SELECT
    `client_id`                                                          AS `client_id`   @id("cf3a8c") @not_null @uniqueness,
    CAST(COALESCE(NULLIF(TRIM(`client_name`), ''), 'UNKNOWN') AS STRING) AS `client_name` @id("45bdd0"),
    CAST(COALESCE(NULLIF(TRIM(`email`), ''), 'UNKNOWN') AS STRING)       AS `email`       @id("f4bc9c"),
    CAST(COALESCE(NULLIF(TRIM(`region`), ''), 'UNKNOWN') AS STRING)      AS `region`      @id("979938"),
    COALESCE(`update_time`, CAST('1900-01-01 00:00:00' AS TIMESTAMP))    AS `update_time` @id("16c278") @not_null
FROM `LATEST_CLIENTS` `clients`
