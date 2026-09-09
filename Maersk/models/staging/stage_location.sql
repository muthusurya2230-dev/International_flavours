{{
config(
materialized = 'view',
database = 'HR',
unique_key = 'location_id',
on_schema_change = 'append_new_columns'
)
}}

with locations as (
  
select
   *
from {{ ref('locations') }}
where location_id is not null
  and city is not null

)

select * from locations
