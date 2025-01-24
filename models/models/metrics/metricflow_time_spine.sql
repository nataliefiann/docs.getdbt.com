{{
   config(
       materialized = 'table',
   )
}}
with days as (
   {{
       dbt_utils.date_spine(
           datepart='day',
           start_date='2020-01-01',
           end_date='2025-01-01'
       )
   }}
),
final as (
   select cast(date_day as date) as date_day
   from days
)
select * from final
