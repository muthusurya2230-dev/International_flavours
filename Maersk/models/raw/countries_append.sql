{{ 
    config( 
        materialized = 'incremental', 
        incremental_strategy = 'append', 
        database = 'HR', 
        unique_key = 'country_id', 
        on_schema_change = 'append_new_columns' 
    ) 
}} 
 
with countries as ( 
 
    select 
       * 
    from {{ source('HR1', 'countries') }} 
 
) 
 
select * from countries 
 
 
{% if is_incremental() %} 
where update_date_time > (select max(update_date_time) from {{ this }}) 
{% endif %}