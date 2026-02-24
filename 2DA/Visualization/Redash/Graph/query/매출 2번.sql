-- 월 x 카테고리 단위 거래액, 주문 수, 주문 고객 수

with product_info as(
    select product_id, price, product.category_id, category.category_name
    from query_1 as product
        inner join query_2 as category
            on product.category_id = category.category_id
)

select strftime('%Y-%m', order_timestamp) as dt
    , category_name
    , sum(price) as gmv
    , count(distinct order_id) as order_count
    , count(distinct user_id) as order_users
from query_3 as orders
    inner join product_info
        on orders.product_id = product_info.product_id
group by 1, 2
order by 1, 2;
