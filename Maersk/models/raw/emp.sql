{{
    config(
        materialized = 'view',
        database = 'HR',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns'
    )
}}

with emp as (

    select
       *
    from {{ source('HR1', 'employees') }}

)

select * from emp