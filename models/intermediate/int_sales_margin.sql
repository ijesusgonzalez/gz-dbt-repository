SELECT
s.*
, p.purchase_price
, ROUND(purchase_price * quantity,2) AS purchase_cost
, ROUND(revenue - (purchase_price * quantity),2) AS margin
FROM {{ ref('stg_raw__sales')}} AS s
JOIN {{ ref('stg_raw__product')}} AS p ON s.products_id = p.products_id
ORDER BY orders_id DESC