{{
    config(
        materialized = 'table',
        database = 'HR',
        on_schema_change = 'append_new_columns'
    )
}}

select A.employee_id, B.employee_id as employee_id_seed from {{ source('HR1', 'employees') }} A
join {{ ref('employees_sample') }} B on A.employee_id = B.employee_id