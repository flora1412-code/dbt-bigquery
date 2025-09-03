{{ config(
    materialized='incremental',
    unique_key='job_run_id'
) }}

with next_id as (

    {% if is_incremental() %}
        -- 如果是增量运行，就从现有表取最大值
        select coalesce(max(job_run_id), 0) + 1 as job_run_id
        from {{ this }}
    {% else %}
        -- 如果是第一次建表，就从1开始
        select 1 as job_run_id
    {% endif %}

)

select
    job_run_id,
    TIMESTAMP(DATETIME(CURRENT_TIMESTAMP(), "Australia/Sydney")) as run_time
from next_id
