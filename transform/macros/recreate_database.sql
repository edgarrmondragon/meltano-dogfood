{% macro export() %}

{% set sql %}
    EXPORT DATABASE 'warehouse' (FORMAT PARQUET);
{% endset %}

{% do log("Exporting database", info=True) %}
{% do run_query(sql) %}
{% do log("Exported database", info=True) %}
{% endmacro %}

{% macro import() %}

{% set sql %}
    IMPORT DATABASE 'warehouse';
{% endset %}

{% do log("Importing database", info=True) %}
{% do run_query(sql) %}
{% do log("Imported database", info=True) %}
{% endmacro %}
