{% macro redact_email(column_name) %}

    CONCAT(
        LEFT({{ column_name }}, 1),
        '*****',
        SUBSTRING(
            {{ column_name }},
            POSITION('@' IN {{ column_name }})
        )
    )

{% endmacro %}