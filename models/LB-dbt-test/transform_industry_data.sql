{{ config(
    materialized='table'
) }}

with base as (
    select *
    from {{ source('LB_dataset', 'industry_data') }}
)

select *
from base
where value is not null

--change for test github
