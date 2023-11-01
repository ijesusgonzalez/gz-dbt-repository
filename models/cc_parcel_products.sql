SELECT
c.*
, p.model_name
, p.quantity
FROM {{ref('cc_parcel')}} c
JOIN {{ref('stg_raw__product')}} as p USING (parcel_id)