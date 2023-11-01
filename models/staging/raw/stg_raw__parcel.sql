with 

source as (

    select * from {{ source('raw', 'parcel') }}

),

renamed as (

    select
        parcel_id AS parcel_id,
        parcel_tracking AS parcel_tracking,
        transporter AS transporter,
        priority AS priority,
        CAST(date_purchase AS DATE) AS date_purchase,  
        CAST(date_shipping AS DATE) AS date_shipping, 
        CAST(date_delivery AS DATE) AS date_delivery, 
        CAST(datecancelled AS DATE) AS date_cancelled

    from source

)

select * from renamed
