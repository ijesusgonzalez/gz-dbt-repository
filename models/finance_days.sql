SELECT
--DATE_TRUNC(date_date, day) AS date
date_date
, CAST(COUNT(date_date) AS INT64)  as nb_transactions
, ROUND(SUM(revenue),0) as revenue
, ROUND(AVG(revenue),2) AS avg_revenue
, ROUND(SUM(order_margin),0) AS margin
, ROUND(SUM(operational_margin),0) AS operational_margin
FROM {{ref('int_orders_operational')}}
GROUP BY date_date
ORDER BY date_date DESC