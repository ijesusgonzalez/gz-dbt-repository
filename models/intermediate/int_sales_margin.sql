SELECT
s.*
, p.purchase_price
FROM {{ ref('stg_raw__sales')}} AS s
JOIN {{ ref('stg_raw__product')}} AS p ON s.products_id = p.products_id
