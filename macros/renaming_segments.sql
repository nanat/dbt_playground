{% macro rename_segments(column_name) %}
    CASE
        WHEN {{ column_name }} IN ('BUILDING', 'HOUSEHOLD', 'FURNITUE')
            THEN 'segment_1'
        ELSE 'segment_2'
    END
{% endmacro %}