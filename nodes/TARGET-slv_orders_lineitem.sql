@id("c7649524-b05a-4246-8c11-999f53fd9926")
@nodeType("708")
SELECT
     `orders`.`order_key` AS `order_key` @not_null @description("Order key this line item belongs to."),
     `lineitem`.`line_number` AS `line_number` @not_null @description("Line number within the order."),
     `orders`.`customer_key` AS `customer_key` @not_null @description("Customer key that placed the order."),
     `orders`.`order_status` AS `order_status` @description("Order status, unmodified."),
     `orders`.`order_date` AS `order_date` @description("Order date, unmodified."),
     `lineitem`.`quantity` AS `quantity` @description("Line item quantity, unmodified."),
     `lineitem`.`extended_price` AS `extended_price` @description("Line item extended price, before discount and tax."),
     `lineitem`.`discount` AS `discount` @description("Line item discount rate."),
     `lineitem`.`tax` AS `tax` @description("Line item tax rate."),
     CAST(`lineitem`.`extended_price` * (1 - `lineitem`.`discount`) * (1 + `lineitem`.`tax`) AS DOUBLE) AS `net_revenue` @not_null @description("Line item revenue after discount and tax: extended_price * (1 - discount) * (1 + tax)."),
     CURRENT_TIMESTAMP() AS `_silver_processed_at` @description("Timestamp this row was cleansed and conformed into the Silver layer.")
FROM {{ ref('TARGET', 'brz_orders') }} `orders`
JOIN {{ ref('TARGET', 'brz_lineitem') }} `lineitem` ON `lineitem`.`order_key` = `orders`.`order_key`
