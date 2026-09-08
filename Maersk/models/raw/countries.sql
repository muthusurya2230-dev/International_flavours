{{
    config(
        materialized = 'table',
        database = 'HR',
        on_schema_change = 'append_new_columns'
    )
}}

with countries as (

    select
       *
    from {{ source('HR1', 'countries') }}

)

select * from countries