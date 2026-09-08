{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'department_id',
        on_schema_change = 'append_new_columns'
    )
}}

with dept as (

    select
       *
    from {{ source('HR1', 'departments') }}

)

select * from dept