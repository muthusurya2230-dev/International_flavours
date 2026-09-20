{{   
    config(   
        materialized = 'incremental',   
        incremental_strategy = 'delete+insert',   
        database = 'HR',   
        unique_key = 'job_id',   
        on_schema_change = 'append_new_columns'   
    )   
}}   
   
with jobs as (   
   
    select   
       *   
    from {{ source('HR1', 'jobs') }}   
   
)   
   
select * from jobs   
   
   
{% if is_incremental() %}   
where update_date_time > (select max(update_date_time) from {{ this }})   
{% endif %}