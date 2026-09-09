@id("3ebebab7-6d9f-463c-84fe-ce88f60417f4")
@nodeType("708")
SELECT
     `customer`.`customer_key` AS `customer_key` @not_null @uniqueness @description("Natural key for the customer."),
     TRIM(`customer`.`customer_name`) AS `customer_name` @not_null @description("Customer name with surrounding whitespace removed."),
     `customer`.`nation_key` AS `nation_key` @not_null @description("Nation key linking the customer to their conformed nation."),
     `nation_region`.`nation_name` AS `nation_name` @not_null @description("Conformed nation name, looked up from the Silver nation/region dimension."),
     `nation_region`.`region_name` AS `region_name` @not_null @description("Conformed region name, looked up from the Silver nation/region dimension."),
     `customer`.`market_segment` AS `market_segment` @description("Customer market segment, unmodified."),
     `customer`.`account_balance` AS `account_balance` @description("Customer account balance, unmodified."),
     CURRENT_TIMESTAMP() AS `_silver_processed_at` @description("Timestamp this row was cleansed and conformed into the Silver layer.")
FROM {{ ref('TARGET', 'brz_customer') }} `customer`
JOIN {{ ref('TARGET', 'slv_nation_region') }} `nation_region` ON `customer`.`nation_key` = `nation_region`.`nation_key`
