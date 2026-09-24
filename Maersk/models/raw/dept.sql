{{  
    config(  
        materialized = 'incremental',  
        incremental_strategy = 'merge',  
        database = 'HR',  
        unique_key = 'department_id',  
        on_schema_change = 'append_new_columns'  
    )  
}}  
  
with dept as (  
  
    select  
       *  
    from {{ source('HR1', 'deptartments') }}  
  
)  
  
select * from dept  
  
  
{% if is_incremental() %}  
where update_date_time > (select max(update_date_time) from {{ this }})  
{% endif %}