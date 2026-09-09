@id("a8d3db9b-d39f-4e58-a386-18d626d8ca83")
@nodeType("708")
WITH sales as(SELECT
     `region` AS `region`,
     `year` AS `year`,
     `amount` AS `amount`
FROM {{ ref('SRC2', 'sales') }} `sales`)

SELECT *
FROM sales
PIVOT (
    SUM(amount)
    FOR year IN ('2024', '2025')
)