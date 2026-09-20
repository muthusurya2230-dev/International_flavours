{% snapshot employee_version1 %}

{{
    config(
      target_schema='dbt_snapshots',
      unique_key='employee_id',
      strategy='timestamp',
      updated_at='update_date_time',
    )
}}

select *
from {{ source('HR1','employees') }}

{% endsnapshot %}