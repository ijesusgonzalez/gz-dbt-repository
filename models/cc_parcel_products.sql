SELECT
c.*
FROM {{ref('cc_parcel')}} c
JOIN {{ref('stg_raw__product')}} as p USING (parcel_id)
ORDER BY parcel_id DESC 