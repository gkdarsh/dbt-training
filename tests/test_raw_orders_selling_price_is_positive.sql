with
orders as (

    select * from {{ ref('raw_orders') }}
)

select 
    ORDERID,
    sum(ORDERSEKKINGPRICE) as total_sp
from orders
group by ORDERID
having total_sp<0    