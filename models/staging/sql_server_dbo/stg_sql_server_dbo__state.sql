{{
    config(materialized='view')
}}


WITH src_addresses AS (
    SELECT
    *
    FROM {{source('sql_server_dbo','addresses')}}
)

SELECT
DISTINCT MD5(STATE) AS STATE_ID,
STATE AS STATE_NAME,
MD5(COUNTRY) AS COUNTRY_ID
FROM src_addresses