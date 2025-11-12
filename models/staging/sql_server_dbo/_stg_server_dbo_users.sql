{{
    config(materialized='view')
}}

WITH src_users AS (
    SELECT
    *
    FROM {{source('sql_server_dbo','users')}}
)

SELECT 
    MD5(USER_ID) AS USER_ID,
    CONVERT_TIMEZONE('UTC',UPDATED_AT) AS UPDATED_AT,
    MD5(ADDRESS_ID) AS ADDRESS_ID,
    LAST_NAME,
    CONVERT_TIMEZONE('UTC',CREATED_AT) AS CREATED_AT,
    PHONE_NUMBER,
    TOTAL_ORDERS,
    FIRST_NAME,
    EMAIL,
    _FIVETRAN_DELETED,
    CONVERT_TIMEZONE('UTC', _FIVETRAN_SYNCED) AS _FIVETRAN_SYNCED
FROM src_users