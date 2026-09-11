@id("4e524911-79db-42d2-9b70-9ac8bd1bef61")
@nodeType("708")
SELECT
     `o_orderkey` AS `order_key` @not_null @uniqueness @description("Natural key for the order, carried through unchanged from the raw feed."),
     `o_custkey` AS `customer_key` @not_null @description("Raw customer key placing this order."),
     `o_orderstatus` AS `order_status` @description("Raw order status, unmodified from source."),
     `o_totalprice` AS `total_price` @description("Raw order total price, unmodified from source."),
     `o_orderdate` AS `order_date` @description("Raw order date, unmodified from source."),
     `o_orderpriority` AS `order_priority` @description("Raw order priority, unmodified from source."),
     `o_clerk` AS `clerk` @description("Raw clerk identifier, unmodified from source."),
     `o_shippriority` AS `ship_priority` @description("Raw shipping priority, unmodified from source."),
     `o_comment` AS `order_comment` @description("Raw comment text, unmodified from source."),
     CURRENT_TIMESTAMP() AS `_bronze_loaded_at` @description("Timestamp this row was ingested into the Bronze layer.")
FROM {{ ref('SRC2', 'orders') }} `orders`
