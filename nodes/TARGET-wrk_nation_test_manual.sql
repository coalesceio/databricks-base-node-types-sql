@id("685e0465-537f-4860-957d-b49b6dc8b87c")
@nodeType("SQLWork")
@writeMode("append")
@description("<text>-changed")
@tag("qa_x", "2")
@tag("qa_z", "1")
SELECT
     `Nation_Key` AS `Nation_Key` @notNull ,
     `Nation_Name` AS `Nation_Name` @primaryKey(1),
     `Region_Key` AS  `Region_Key` @clusterKey(1),
     `Nation_Comment` AS `Nation_Comment`
FROM {{ ref('SRC', 'nation_test') }} `nation_test`
WHERE `Nation_Key` IS NOT NULL
AND Nation_Name IS NOT NULL;