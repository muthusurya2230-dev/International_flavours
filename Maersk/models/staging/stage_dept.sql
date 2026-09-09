{{
config(
materialized = 'view',
database = 'HR',
unique_key = 'department_id',
on_schema_change = 'append_new_columns'
)
}}

with department as (

select
   *
from {{ ref('dept') }}
where department_id is not null

)

select * from department
