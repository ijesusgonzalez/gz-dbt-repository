{{ config(
  materialized='table',
) }}

SELECT
c.parcel_id
, p.model_name
, c.parcel_tracking
, c.transporter
, c. priority
, c.date_purchase
, c.date_shipping
, c.date_delivery
, c.date_cancelled
, c.month_purchase
, c.status
, c.expedition_time
, c.transport_time
, c.delivery_time
, c.delay
, p.quantity
FROM {{ref('cc_parcel')}} c
JOIN {{ref('stg_cc_product')}} as p USING (parcel_id)
GROUP BY parcel_id,model_name, parcel_tracking, transporter, priority, date_purchase, date_shipping, date_delivery, date_cancelled, month_purchase, status, expedition_time, transport_time, delivery_time, expedition_time, delay, quantity
ORDER BY parcel_id DESC 