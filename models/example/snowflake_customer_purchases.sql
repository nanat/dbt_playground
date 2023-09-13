{{ config(materialized='table') }}

--select c.c_custkey, c.c_name, c.c_nationkey, sum(o.o_totalprice) as total_order_price
--from snowflake_sample_data.tpch_sf1.customer c
--left join snowflake_sample_data.tpch_sf1.orders o
--on c.c_custkey = o.o_custkey
--group by c.c_custkey, c.c_name, c.c_nationkey
--having sum(o.o_totalprice) > 0

select c.c_custkey, c.c_name, c.c_nationkey, sum(o.o_totalprice) as total_order_price
from {{ source("snowflake_sample", "customer") }} c
left join {{ source("snowflake_sample", "orders")}} o
on c.c_custkey = o.o_custkey
{{ group_by(3) }} --macro
having sum(o.o_totalprice) > 0