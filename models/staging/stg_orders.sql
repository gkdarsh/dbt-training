select
--from raw_orders
o.ORDERID,
o.ORDERDATE,
o.SHIPDATE,
o.SHIPMODE,
o.ORDERSEKKINGPRICE - o.ORDERCOSTPRICE as orderprofit,
o.ORDERCOSTPRICE,
o.ORDERSEKKINGPRICE,
-- from customer
c.CUSTOMERID,
c.CUSTOMERNAME,
c.SEGMENT,
c.COUNTRY,
-- from raw_product
p.PRODUCTID,
p.CATEGORY,
p.PRODUCTNAME,
p.SUBCATEGORY
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.CUSTOMERID = c.CUSTOMERID
left join {{ ref('raw_product') }} as p
on o.PRODUCTID = p.PRODUCTID