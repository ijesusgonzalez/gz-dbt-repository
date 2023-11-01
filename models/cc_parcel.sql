SELECT
pa.*
, pr.model_name
, pr.quantity
FROM {{ref('stg_raw__parcel')}} as pa
JOIN {{ref('stg_raw__product')}} as pr
USING (parcel_id)
ORDER BY parcel_id