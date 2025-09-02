{{ config(materialized='table') }}

with sydneytime as (

    SELECT CURRENT_DATETIME("Australia/Sydney") as test_time

)

select *
from sydneytime