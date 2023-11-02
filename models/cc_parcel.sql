WITH nb_model AS (

SELECT
parcel_id
,SUM(quantity) AS quantity
,COUNT(DISTINCT model_name) AS nb_model
FROM {{ref('stg_raw__product')}}
GROUP BY parcel_id)



SELECT
p.*
-- , pr.model_name
-- , pr.quantity
, EXTRACT(month FROM date_purchase) AS month_purchase
,CASE
WHEN date_cancelled IS NOT null THEN "Cancelled"
WHEN date_shipping IS null THEN "In Progress"
WHEN date_delivery IS null THEN "In Transit"
WHEN date_delivery IS NOT null THEN "Delivered"
END AS status
,DATE_DIFF(date_shipping, date_purchase, day) AS expedition_time
,DATE_DIFF(date_delivery, date_shipping, day) AS transport_time
,DATE_DIFF(date_delivery, date_purchase, day) AS delivery_time
,IF(date_delivery IS null, null, IF (DATE_DIFF(date_delivery, date_purchase, day)>5,1,0)) AS delay
,m.quantity
,m.nb_model
FROM {{ref('stg_cc_parcel')}} as p
JOIN nb_model as m
USING (parcel_id)
-- GROUP BY parcel_id
ORDER BY parcel_id DESC