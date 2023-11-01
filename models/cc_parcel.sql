WITH nb_model AS (

SELECT
parcel_id
,COUNT(DISTINCT model_name) AS nb_model
FROM {{ref('stg_raw__product')}}
GROUP BY parcel_id)



SELECT
p.*
-- , pr.model_name
-- , pr.quantity
, EXTRACT(month FROM date_purchase) AS mont_purchase
,CASE
WHEN date_cancelled IS NOT null THEN "Cancelled"
WHEN date_delivery IS NOT null THEN "Delivered"
WHEN date_shipping IS NOT null THEN "Shipped"
WHEN date_purchase IS NOT null THEN "Purchase"
END AS status
,DATE_DIFF(date_shipping, date_purchase, day) AS expedition_time
,DATE_DIFF(date_delivery, date_shipping, day) AS transport_time
,DATE_DIFF(date_delivery, date_purchase, day) AS delivery_time
,m.nb_model
FROM {{ref('stg_raw__parcel')}} as p
JOIN nb_model as m
USING (parcel_id)
-- GROUP BY parcel_id
ORDER BY parcel_id