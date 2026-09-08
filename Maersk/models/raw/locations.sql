{{
    config(
        materialized = 'view',
        database = 'HR',
        unique_key = 'location',
        on_schema_change = 'append_new_columns'
    )
}}

with locations as (

    select
       *
    from {{ source('HR1', 'locations') }}

)

select * from locations