@id("84256344-cec0-4ecc-ab11-4ae90714d011")
@nodeType("708")
SELECT
     `c_custkey` AS `c_custkey`,
     `c_name` AS `c_name`,
     `c_address` AS `c_address`,
     `c_nationkey` AS `c_nationkey`,
     `c_phone` AS `c_phone`,
     `c_acctbal` AS `c_acctbal`,
     `c_mktsegment` AS `c_mktsegment`,
     `c_comment` AS `c_comment`
FROM {{ ref('SRC', 'customer') }} `customer`