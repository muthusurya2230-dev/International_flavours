{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'delete+insert',
        database = 'HR',
        unique_key = 'job_history_id',
        on_schema_change = 'append_new_columns'
    )
}}

with job_history as (

    select
        *
    from {{ source('HR1', 'job_history') }}

)

select * from job_history

{% if is_incremental() %}
where update_date_time > (
    select max(update_date_time)
    from {{ this }}
)
{% endif %}