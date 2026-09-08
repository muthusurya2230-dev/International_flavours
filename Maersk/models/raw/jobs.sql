{{
    config(
        materialized = 'view',
        database = 'HR',
        unique_key = 'Job_id',
        on_schema_change = 'append_new_columns'
    )
}}

with jobs as (

    select
       *
    from {{ source('HR1', 'jobs') }}

)

select * from jobs