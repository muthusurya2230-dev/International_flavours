{{
config(
materialized = 'table',
database = 'HR',
on_schema_change = 'append_new_columns'
)
}}

with regions as (

select
   *
from {{ ref('regions') }}
where region_id is not null
  and region_name is not null

)

select * from regions
