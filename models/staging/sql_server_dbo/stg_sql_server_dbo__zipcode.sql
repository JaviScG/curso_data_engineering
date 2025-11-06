{{
    config(materialized='view')
}}


WITH src_addresses AS (
    SELECT
    *
    FROM {{source('sql_server_dbo','addresses')}}
)

SELECT
DISTINCT MD5(ZIPCODE) AS ZIPCODE_ID,
ZIPCODE,
MD5(STATE) AS STATE_ID
FROM src_addresses