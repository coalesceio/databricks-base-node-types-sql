@id("6c4cab32-6964-4fe8-96d4-472b5cda7618")
@nodeType("SQLWork")
SELECT
     CAST(`client_id` AS BIGINT)   AS `client_id` @primaryKey(1),
     `client_name`                 AS `client_name`,
     `email`                       AS `email`,
     `region`                      AS `region`,
     `update_time`                 AS `update_time`
FROM {{ ref('SRC', 'clients') }} `clients`