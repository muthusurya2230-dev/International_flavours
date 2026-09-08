{{
    config(
        materialized = 'table',
        database = 'HR',
        on_schema_change = 'append_new_columns'
    )
}}

with regions as (

    select
       *
    from {{ source('HR1', 'regions') }}

)

select * from regions