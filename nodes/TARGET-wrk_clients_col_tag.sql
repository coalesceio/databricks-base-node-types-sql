@id("45ec188d-bef4-43d5-a49c-b9a81519516d")
@nodeType("708")
SELECT
     `client_id` AS `client_id`,
     `client_name` AS `client_name`,
     `email` AS `email` @tag("PII1", "YES"),
     `region` AS `region`,
     `update_time` AS `update_time`
FROM {{ ref('SRC', 'clients') }} `clients`