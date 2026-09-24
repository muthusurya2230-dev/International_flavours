{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns'
    )
}}

with emp as (

    select
        employee_id,
        first_name,
        last_name,
        first_name || '-' || last_name AS full_name,
        email,
        {{ redact_email('email') }} AS email_macro,
        {{ gmail('email') }} AS email_macro_gmail,
        case when salary > 50000 then 'High' else 'Low' end AS salary_level,
        salary      
    from {{ source('HR1', 'employees') }}

)

select * from emp