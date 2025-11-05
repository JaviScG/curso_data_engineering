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
DISCOUNT AS DISCOUNT_DOLLARS,
STATUS,
_FIVETRAN_DELETED,
_FIVETRAN_SYNCED
FROM src_promos

UNION ALL

SELECT
    MD5('NO_PROMO') AS PROMO_ID,
    0 AS DISCOUNT_DOLLARS,  
    'NO_PROMO' AS STATUS,
    NULL AS _FIVETRAN_DELETED,
    NULL AS _FIVETRAN_SYNCED
