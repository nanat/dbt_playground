{{ config(materialized='table') }}

--select c.c_custkey, c.c_name, c.c_nationkey, sum(o.o_totalprice) as total_order_price
--from snowflake_sample_data.tpch_sf1.customer c
--left join snowflake_sample_data.tpch_sf1.orders o
--on c.c_custkey = o.o_custkey
--group by c.c_custkey, c.c_name, c.c_nationkey
--having sum(o.o_totalprice) > 0

with sample_customer as (
    select *
    from {{ source('snowflake_sample', 'customer') }}
),
sample_orders as (
    select *
    from {{ source('snowflake_sample', 'orders') }}
)

select c.c_custkey, c.c_name, c.c_nationkey, sum(o.o_totalprice) as total_order_price
from sample_customer c
left join sample_orders o
on c.c_custkey = o.o_custkey
{{ group_by(3) }} --macro
having sum(o.o_totalprice) > 0