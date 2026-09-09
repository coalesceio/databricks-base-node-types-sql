@id("0e49de98-0731-49db-a529-64d54391eaf1")
@nodeType("708")
@writeMode("truncateInsert")
SELECT
     `customer`.`region_name` AS `region_name` @not_null @description("Region this summary row aggregates."),
     `customer`.`nation_name` AS `nation_name` @not_null @uniqueness @description("Nation this summary row aggregates."),
     COUNT(DISTINCT `customer`.`customer_key`) AS `customer_count` @not_null @description("Distinct customers billed to this nation."),
     COUNT(DISTINCT `orders`.`order_key`) AS `order_count` @not_null @description("Distinct orders placed by customers in this nation."),
     SUM(`orders`.`net_revenue`) AS `total_net_revenue` @not_null @description("Total line-item revenue, net of discount and tax, for this nation."),
     MAX(`orders`.`_silver_processed_at`) AS `_gold_refreshed_at` @description("Timestamp this Gold summary was last refreshed.")
FROM {{ ref('TARGET', 'slv_customer') }} `customer`
JOIN {{ ref('TARGET', 'slv_orders_lineitem') }} `orders` ON `orders`.`customer_key` = `customer`.`customer_key`
GROUP BY `customer`.`region_name`, `customer`.`nation_name`
