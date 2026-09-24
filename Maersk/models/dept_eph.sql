{{
    config(
        materialized = 'table',
        database = 'HR',
        on_schema_change = 'append_new_columns'
    )
}}

select b.first_name from {{ source('HR1', 'departments') }} A
join {{ ref('emp_eph') }} B on A.department_id = B.department_id