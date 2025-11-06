{{
    config(materialized='view')
}}


WITH src_addresses AS (
    SELECT
    *
    FROM {{source('sql_server_dbo','addresses')}}
)

SELECT
ADDRESS_ID,
MD5(ZIPCODE) AS ZIPCODE_ID,
regexp_replace(ADDRESS,'[0-9]+\\s','') AS STREET,
ADDRESS,
_FIVETRAN_DELETED,
_FIVETRAN_SYNCED
FROM src_addresses
WHERE _FIVETRAN_DELETED IS NULL
