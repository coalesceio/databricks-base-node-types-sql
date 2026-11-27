@id("a5f6b2d1-d9c2-47ed-a3cc-7b8c166d5292")
@nodeType("SQLWork")
SELECT
     `Nation_Key` AS `Nation_Key` @primaryKey(1),
     `Nation_Name` AS `Nation_Name`,
     `Region_Key` AS `Region_Key`,
     `Nation_Comment` AS `Nation_Comment`
FROM {{ ref('SRC', 'nation_test') }} `nation_test`