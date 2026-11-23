@id("d8425867-076a-4a23-b34b-a2876d85f946")
@nodeType("708")
@tag("PII1", "YES")
SELECT
     `client_id` AS `client_id`,
     `client_name` AS `client_name`,
     `email` AS `email`,
     `region` AS `region`,
     `update_time` AS `update_time`
FROM {{ ref('SRC', 'clients') }} `clients`