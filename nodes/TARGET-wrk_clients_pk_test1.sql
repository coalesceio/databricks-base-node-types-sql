@id("e580a070-71bf-44ea-8f20-48378be8a751")
@nodeType("SQLWork")
SELECT
     CAST(`client_id` AS BIGINT)  AS `client_id` @primaryKey(1),
     `client_name` AS `client_name`,
     `email` AS `email`,
     `region` AS `region`,
     `update_time` AS `update_time`
FROM {{ ref('SRC', 'clients') }} `clients`