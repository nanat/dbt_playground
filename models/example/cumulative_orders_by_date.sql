{{ config(materialized='table') }}

with sample_orders as (
    select *
    from {{ source('snowflake_sample', 'orders') }}
)

select o.o_orderdate, sum(o.o_totalprice) as cumulative_sales
from sample_orders o
{% if target.name == 'dev' %}
    where year(o_orderdate) = 1996
{% endif %}
group by o.o_orderdate