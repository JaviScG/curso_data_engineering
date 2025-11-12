{{
    config(materialized='view')
}}


WITH src_orders AS (
    SELECT
    *
    FROM {{source('sql_server_dbo','orders')}}
)

SELECT
DISTINCT MD5(INITCAP(SHIPPING_SERVICE)) AS SHIPPING_SERVICE_ID,
INITCAP(SHIPPING_SERVICE) AS SHIPPING_SERVICE_NAME
FROM src_orders
WHERE SHIPPING_SERVICE != ''
