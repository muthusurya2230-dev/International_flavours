{% macro gmail(column_name) %}

   CONCAT({{ column_name }}, '@gmail.com')
   
{% endmacro %}