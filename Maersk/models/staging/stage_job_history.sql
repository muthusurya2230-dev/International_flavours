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
from {{ ref('job_history') }}
where end_date >= start_date

)

select * from job_history
