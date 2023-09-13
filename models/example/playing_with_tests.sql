--select *
--from SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.CUSTOMER

with sample_customer as (
    select *
    from {{ source('snowflake_sample', 'customer') }}
)

select c_custkey, c_mktsegment, {{ rename_segments('c_mktsegment') }} mkt_segment_adjusted, c_acctbal
from sample_customer
