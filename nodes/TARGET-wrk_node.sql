@id("9f32fa42-7b2b-4035-861f-5b315ab1d2b6")
@nodeType("SQLWork")
WITH sales_cte AS
(
    SELECT 'Laptop' AS product, 'INDIA' AS region, 1000 AS sales
    UNION ALL
    SELECT 'Laptop', 'USA', 2000
    UNION ALL
    SELECT 'Mobile', 'INDIA', 1500
    UNION ALL
    SELECT 'Mobile', 'USA', 2500
)
SELECT *
FROM sales_cte
PIVOT
(
    SUM(sales)
    FOR region IN ('INDIA', 'USA')
)