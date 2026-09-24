{{
    config(
        materialized = 'ephemeral',
        database = 'HR',
        on_schema_change = 'append_new_columns'
    )
}}

with emp as (

    select
       *
    from {{ source('HR1', 'employees') }}
    where employee_id=500

)

select * from emp