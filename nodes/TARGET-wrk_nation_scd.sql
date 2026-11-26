@id("42d16dff-790f-4f88-b278-48752ec86cf7")
@nodeType("SQLWork")
@description("SCD pipeline - work table: SRC.nation enriched with region name from SRC2.region, one row per n_nationkey (latest timestamp_col)")
@writeMode("truncateInsert")
WITH `LATEST_NATION` AS (
    SELECT *
    FROM {{ ref('SRC', 'nation') }}
    WHERE `n_nationkey` IS NOT NULL
    QUALIFY ROW_NUMBER() OVER (PARTITION BY `n_nationkey` ORDER BY `timestamp_col` DESC NULLS LAST) = 1
)
SELECT
    `nation`.`n_nationkey`                                                       AS `n_nationkey`   @id("63578f") @not_null @uniqueness,
    CAST(COALESCE(NULLIF(TRIM(`nation`.`n_name`), ''), 'UNKNOWN') AS STRING)     AS `n_name`        @id("dde292"),
    `nation`.`n_regionkey`                                                       AS `n_regionkey`   @id("19d545"),
    CAST(COALESCE(NULLIF(TRIM(`region`.`r_name`), ''), 'UNKNOWN') AS STRING)     AS `r_name`        @id("bd22a8"),
    CAST(COALESCE(`nation`.`n_comment`, '') AS STRING)                           AS `n_comment`     @id("bd75f3"),
    COALESCE(`nation`.`timestamp_col`, CAST('1900-01-01 00:00:00' AS TIMESTAMP)) AS `timestamp_col` @id("832c7e") @not_null
FROM `LATEST_NATION` `nation`
LEFT JOIN {{ ref('SRC2', 'region') }} `region`
    ON `nation`.`n_regionkey` = `region`.`r_regionkey`
