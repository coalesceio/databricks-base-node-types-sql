@id("178f17d5-de44-4baf-8243-4123cd060624")
@nodeType("708")
@description("Work table - cleaned clients, one row per client_id (latest update_time). Source for the dimension test nodes")
@writeMode("truncateInsert")
WITH `LATEST_CLIENTS` AS (
    SELECT *
    FROM {{ ref('SRC', 'clients') }}
    WHERE `client_id` IS NOT NULL
    QUALIFY ROW_NUMBER() OVER (PARTITION BY `client_id` ORDER BY `update_time` DESC NULLS LAST) = 1
)
SELECT
    `client_id`                                                       AS `client_id`   @id("ab32fc") @not_null @uniqueness,
    CAST(COALESCE(NULLIF(TRIM(`client_name`), ''), 'UNKNOWN') AS STRING)              AS `client_name` @id("d041c2"),
    CAST(COALESCE(NULLIF(TRIM(`email`), ''), 'UNKNOWN') AS STRING)                    AS `email`       @id("57034b"),
    CAST(COALESCE(NULLIF(TRIM(`region`), ''), 'UNKNOWN') AS STRING)                   AS `region`      @id("3b075c"),
    COALESCE(`update_time`, CAST('1900-01-01 00:00:00' AS TIMESTAMP)) AS `update_time` @id("1254ff") @not_null
FROM `LATEST_CLIENTS` `clients`
