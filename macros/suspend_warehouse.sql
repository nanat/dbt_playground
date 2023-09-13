{% macro suspend_wh(wh_name) %}
    {% set sql %}
        alter warehouse {{wh_name}} suspend
    {% endset %}

    {% set table = run_query(sql) %}
    {% do table.print_table() %}
{% endmacro %}


-- to run macros from dbt
-- dbt run-operation suspend_wh --args '{wh_name: transform_wh}'