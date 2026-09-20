{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'delete+insert',
        database = 'HR',
        unique_key = 'region_id',
        on_schema_change = 'append_new_columns'
    )
}}

with regions as (

    select
        *
    from {{ source('HR1', 'regions') }}

)

select * from regions

{% if is_incremental() %}
where update_date_time > (
    select max(update_date_time)
    from {{ this }}
)
{% endif %}