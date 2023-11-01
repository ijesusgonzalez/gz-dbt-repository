with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        parcel_id AS parcel_id,
        model_mame AS model_name,
        quantity AS quantity

    from source
    GROUP BY parcel_id, model_name, quantity
    ORDER BY parcel_id

)

select * from renamed
