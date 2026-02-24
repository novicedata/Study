-- 월 단위 거래액, 주문수, 주문 고객 수

with product_info as(
    select product_id, price
    from query_1 -- prorduct
)

select strftime('%Y-%m', order_timestamp) as dt
    , sum(price) as gmv
    , count(distinct order_id) as order_count
    , count(distinct user_id) as order_users
from query_3 as orders
    left join product_info
        on orders.product_id = product_info.product_id
group by 1
order by 1 desc;
