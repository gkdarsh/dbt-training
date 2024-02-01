{{
    config(
        materialized='table'
    )
}}

select * from 
{{ source('globalmart', 'CUSTOMER') }}