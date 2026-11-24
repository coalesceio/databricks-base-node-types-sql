@id("19fe8702-5de6-46d2-9a4a-db5b499a8f5c")
@nodeType("708")
SELECT
     `client_id` AS `client_id` @clusterKey(1),
     `client_name` AS `client_name`,
     `email` AS `email`,
     `region` AS `region`,
     `update_time` AS `update_time`
FROM {{ ref('SRC', 'clients') }} `clients`