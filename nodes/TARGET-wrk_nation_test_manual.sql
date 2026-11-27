@id("685e0465-537f-4860-957d-b49b6dc8b87c")
@nodeType("SQLWork")
@writeMode("append")
@description("<text>")
SELECT
     `Nation_Key` AS `Nation_Key` @notNull ,
     `Nation_Name` AS `Nation_Name`,
     `Region_Key` AS  `Region_Key`,
     `Nation_Comment` AS `Nation_Comment`
FROM {{ ref('SRC', 'nation_test') }} `nation_test`
WHERE `Nation_Key` IS NOT NULL
AND Nation_Name IS NOT NULL;