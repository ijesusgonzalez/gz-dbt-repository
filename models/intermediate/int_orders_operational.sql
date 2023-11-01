SELECT 
m.*
--,s.*
, (order_margin + shipping_fee - log_cost - CAST(ship_cost AS INT64)) AS operational_margin
FROM {{ ref('int_orders_margin')}} AS m
LEFT JOIN {{ ref('stg_raw__ship')}} AS s ON m.orders_id = s.orders_id
ORDER BY orders_id DESC