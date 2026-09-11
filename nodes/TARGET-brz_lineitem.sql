@id("0f66c813-255f-437e-9e69-e305a9e3bdfc")
@nodeType("708")
SELECT
     `l_orderkey` AS `order_key` @not_null @description("Raw order key this line item belongs to."),
     `l_linenumber` AS `line_number` @not_null @description("Raw line number within the order."),
     `l_partkey` AS `part_key` @description("Raw part key, unmodified from source."),
     `l_suppkey` AS `supplier_key` @description("Raw supplier key, unmodified from source."),
     `l_quantity` AS `quantity` @description("Raw quantity, unmodified from source."),
     `l_extendedprice` AS `extended_price` @description("Raw extended price, unmodified from source."),
     `l_discount` AS `discount` @description("Raw discount rate, unmodified from source."),
     `l_tax` AS `tax` @description("Raw tax rate, unmodified from source."),
     `l_returnflag` AS `return_flag` @description("Raw return flag, unmodified from source."),
     `l_linestatus` AS `line_status` @description("Raw line status, unmodified from source."),
     `l_shipdate` AS `ship_date` @description("Raw ship date, unmodified from source."),
     `l_commitdate` AS `commit_date` @description("Raw commit date, unmodified from source."),
     `l_receiptdate` AS `receipt_date` @description("Raw receipt date, unmodified from source."),
     `l_shipinstruct` AS `ship_instruct` @description("Raw shipping instructions, unmodified from source."),
     `l_shipmode` AS `ship_mode` @description("Raw shipping mode, unmodified from source."),
     `l_comment` AS `line_comment` @description("Raw comment text, unmodified from source."),
     CURRENT_TIMESTAMP() AS `_bronze_loaded_at` @description("Timestamp this row was ingested into the Bronze layer.")
FROM {{ ref('SRC2', 'lineitem') }} `lineitem`
