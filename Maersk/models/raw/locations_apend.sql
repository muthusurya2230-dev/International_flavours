{{  
    config(  
        materialized = 'incremental',  
        incremental_strategy = 'append',  
        database = 'HR',  
        unique_key = 'location_id',  
        on_schema_change = 'append_new_columns'  
    )  
}}  
  
with locations as (  
  
    select  
       *  
    from {{ source('HR1', 'locations') }}  
  
)  
  
select * from locations  
  
  
{% if is_incremental() %}  
where update_date_time > (select max(update_date_time) from {{ this }})  
{% endif %}