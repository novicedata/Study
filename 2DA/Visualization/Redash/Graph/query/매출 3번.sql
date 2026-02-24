-- 고객 단위 거래액, 주문 수

with product_info as(
    select product_id, price
    from query_1
)

select strftime('%Y-%m', order_timestamp) as dt
    , user_id
    , sum(price) as gmv
from query_3 as orders
    inner join product_info
        on orders.product_id = product_info.product_id
group by 1, 2;
