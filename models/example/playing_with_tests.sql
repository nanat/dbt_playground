--select *
--from SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.CUSTOMER

select c_custkey, c_mktsegment, {{ rename_segments('c_mktsegment') }} mkt_segment_adjusted
from {{ source('snowflake_sample', 'customer')}}