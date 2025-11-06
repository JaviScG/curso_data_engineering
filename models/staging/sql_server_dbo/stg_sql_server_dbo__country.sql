{{
    config(materialized='view')
}}


WITH src_addresses AS (
    SELECT
    *
    FROM {{source('sql_server_dbo','addresses')}}
)

SELECT
DISTINCT MD5(COUNTRY) AS COUNTRY_ID,
COUNTRY AS COUNTRY_NAME
FROM src_addresses