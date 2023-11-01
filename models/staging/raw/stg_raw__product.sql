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

)

select * from renamed
