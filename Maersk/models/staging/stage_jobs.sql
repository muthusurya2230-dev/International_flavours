{{
config(
materialized = 'view',
database = 'HR',
unique_key = 'job_id',
on_schema_change = 'append_new_columns'
)
}}

with jobs as (

select
   *
from {{ ref('jobs') }}
where min_salary > 0
  and max_salary >= min_salary


)

select * from jobs
