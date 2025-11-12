{{
    config(materialized='view')
}}


WITH src_promos AS (
    SELECT
    *
    FROM {{source('sql_server_dbo','promos')}}
)

SELECT
MD5(PROMO_ID) AS PROMO_ID,
PROMO_ID AS PROMO_NAME,
DISCOUNT AS DISCOUNT_DOLLARS,
STATUS,
_FIVETRAN_DELETED,
CONVERT_TIMEZONE('UTC',_FIVETRAN_SYNCED) AS _FIVETRAN_SYNCED 
FROM src_promos
WHERE _FIVETRAN_DELETED IS NULL