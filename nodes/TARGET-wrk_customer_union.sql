@id("210cfd42-d503-4307-a52d-5a294b502612")
@nodeType("708")
(SELECT
     `c_custkey` AS `c_custkey`,
     `c_name` AS `c_name`,
     `c_address` AS `c_address`,
     `c_nationkey` AS `c_nationkey`,
     `c_phone` AS `c_phone`,
     `c_acctbal` AS `c_acctbal`,
     `c_mktsegment` AS `c_mktsegment`,
     `c_comment` AS `c_comment`
FROM {{ ref('SRC2', 'customer1') }} `customer1`
UNION
SELECT
     `c_custkey` AS `c_custkey`,
     `c_name` AS `c_name`,
     `c_address` AS `c_address`,
     `c_nationkey` AS `c_nationkey`,
     `c_phone` AS `c_phone`,
     `c_acctbal` AS `c_acctbal`,
     `c_mktsegment` AS `c_mktsegment`,
     `c_comment` AS `c_comment`
FROM {{ ref('SRC2', 'customer2') }} `customer2`)
where c_custkey > 2
