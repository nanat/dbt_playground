{{ config(materialized='table') }}

select o.o_orderdate, sum(o.o_totalprice) as cumulative_sales
from snowflake_sample_data.tpch_sf1.orders o
group by o.o_orderdate