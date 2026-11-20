@id("72471fe1-4d86-4075-96bc-83c90c22c894")
@nodeType("708")
@description("Work table - CTE de-duplicating the source, with SHA1 and MD5 hash columns")
WITH `LATEST_CLIENTS` AS (
    SELECT *
    FROM {{ ref('SRC', 'clients') }}
    QUALIFY ROW_NUMBER() OVER (PARTITION BY `client_id` ORDER BY `update_time` DESC) = 1
)
SELECT
    `client_id`                                        AS `client_id`   @id("675ccf") @inHash("ROW_HASH", 1),
    `client_name`                                      AS `client_name` @id("3d1b00") @inHash("ROW_HASH", 2) @inHash("NAME_HASH", 1),
    `email`                                            AS `email`       @id("5e8362") @inHash("ROW_HASH", 3),
    `region`                                           AS `region`      @id("07c387"),
    `update_time`                                      AS `update_time` @id("081d5b"),
    CAST({{ get_hash('ROW_HASH') }} AS STRING)         AS `ROW_HASH`    @id("39bb12") @not_null,
    CAST({{ get_hash('NAME_HASH', 'MD5') }} AS STRING) AS `NAME_HASH`   @id("df68eb")
FROM `LATEST_CLIENTS` `clients`