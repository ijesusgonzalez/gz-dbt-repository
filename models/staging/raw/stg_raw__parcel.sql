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
        CAST(PARSE_DATE('%B %d, %Y', date_purchase) AS DATE) AS date_purchase,  
        CAST(PARSE_DATE('%B %d, %Y', date_shipping) AS DATE) AS date_shipping, 
        CAST(PARSE_DATE('%B %d, %Y', date_delivery) AS DATE) AS date_delivery, 
        CAST(PARSE_DATE('%B %d, %Y', datecancelled) AS DATE) AS date_cancelled 

    from source
    --GROUP BY parcel_id, parcel_tracking, transporter, priority, date_purchase, date_shipping, date_delivery, date_cancelled
    ORDER BY parcel_id DESC

)

select * from renamed
