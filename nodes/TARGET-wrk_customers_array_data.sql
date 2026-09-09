@id("1fbc9015-54b6-4429-aac4-3f22dffea487")
@nodeType("708")
SELECT
    customer_id,
    customer_name,
    position,
    product
FROM {{ ref('SRC2', 'customers_array_data') }} `customers_array_data`
LATERAL VIEW POSEXPLODE(products) e AS position, product