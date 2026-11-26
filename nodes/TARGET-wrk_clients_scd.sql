@id("42d16dff-790f-4f88-b278-48752ec86cf7")
@nodeType("SQLWork")
@description("SCD pipeline - work table: cleaned clients from SRC.clients, one row per client_id (latest update_time)")
@writeMode("truncateInsert")
WITH `LATEST_CLIENTS` AS (
    SELECT *
    FROM {{ ref('SRC', 'clients') }}
    WHERE `client_id` IS NOT NULL
    QUALIFY ROW_NUMBER() OVER (PARTITION BY `client_id` ORDER BY `update_time` DESC NULLS LAST) = 1
)
SELECT
    `client_id`                                                          AS `client_id`   @id("63578f") @not_null @uniqueness,
    CAST(COALESCE(NULLIF(TRIM(`client_name`), ''), 'UNKNOWN') AS STRING) AS `client_name` @id("dde292"),
    CAST(COALESCE(NULLIF(TRIM(`email`), ''), 'UNKNOWN') AS STRING)       AS `email`       @id("19d545"),
    CAST(COALESCE(NULLIF(TRIM(`region`), ''), 'UNKNOWN') AS STRING)      AS `region`      @id("bd22a8"),
    COALESCE(`update_time`, CAST('1900-01-01 00:00:00' AS TIMESTAMP))    AS `update_time` @id("832c7e") @not_null
FROM `LATEST_CLIENTS` `clients`
