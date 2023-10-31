SELECT
*
FROM sgt_raw_sales AS s
JOIN stg_raw__product AS p ON s.products_id = p.products_id