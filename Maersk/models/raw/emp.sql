{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'merge',
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


{% if is_incremental() %}
where update_date_time > (select max(update_date_time) from {{ this }})
{% endif %}