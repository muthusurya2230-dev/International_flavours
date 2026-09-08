{{
    config(
        materialized = 'view',
        database = 'HR',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns'
    )
}}

with job_history as (

    select
       *
    from {{ source('HR1', 'job_history') }}

)

select * from job_history