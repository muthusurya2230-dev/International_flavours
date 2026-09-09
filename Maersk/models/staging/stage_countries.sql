{{
config(
materialized = 'table',
database = 'HR',
on_schema_change = 'append_new_columns'
)
}}

with countries as (

select
   *
from {{ ref('countries') }}
where country_id is not null
  and country_name is not null
  and region_id is not null

)

select * from countries
