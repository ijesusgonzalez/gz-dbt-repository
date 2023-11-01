SELECT
pr.*
FROM {{ref(stg_raw__product)}} as pr
JOIN {{ref(stg_raw__parcel)}} as pa
USING parcel_id
