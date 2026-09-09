@id("1021112e-325c-431b-8716-7d9cd42a27f8")
@nodeType("708")
SELECT
     `c_custkey` AS `customer_key` @not_null @uniqueness @description("Natural key for the customer, carried through unchanged from the raw feed."),
     `c_name` AS `customer_name` @description("Raw customer name, unmodified from source."),
     `c_address` AS `customer_address` @description("Raw customer address, unmodified from source."),
     `c_nationkey` AS `nation_key` @not_null @description("Raw nation key linking the customer to their nation."),
     `c_phone` AS `customer_phone` @description("Raw phone number, unmodified from source."),
     `c_acctbal` AS `account_balance` @description("Raw account balance, unmodified from source."),
     `c_mktsegment` AS `market_segment` @description("Raw market segment, unmodified from source."),
     `c_comment` AS `customer_comment` @description("Raw comment text, unmodified from source."),
     CURRENT_TIMESTAMP() AS `_bronze_loaded_at` @description("Timestamp this row was ingested into the Bronze layer.")
FROM {{ ref('SRC', 'customer') }} `customer`
