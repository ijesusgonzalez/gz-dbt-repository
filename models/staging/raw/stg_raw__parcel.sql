with

    source as (select * from {{ source("raw", "parcel") }}),

    renamed as (

        select
            parcel_id as parcel_id,
            parcel_tracking as parcel_tracking,
            transporter as transporter,
            priority as priority,
            cast(parse_date('%B %d, %Y', date_purchase) as date) as date_purchase,
            cast(parse_date('%B %d, %Y', date_shipping) as date) as date_shipping,
            cast(parse_date('%B %d, %Y', date_delivery) as date) as date_delivery,
            cast(parse_date('%B %d, %Y', datecancelled) as date) as date_cancelled

        from source
        -- GROUP BY parcel_id, parcel_tracking, transporter, priority, date_purchase,
        -- date_shipping, date_delivery, date_cancelled
        order by parcel_id desc

    )

select *
from renamed
