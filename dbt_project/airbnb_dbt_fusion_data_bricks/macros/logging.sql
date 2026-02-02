{% macro learn_logging() %}
    {{ log("Call your mom!") }}
    {{ log("Call your dad!", info=True) }}
    {# log("Call your dad comment test!", info=True) #} 
{% endmacro %}