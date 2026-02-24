-- 거래액 기준 Top 5위 샵

with product_info as(
    select product_id, price, shop_id
    from query_1
)

, rank as (
    select *
        , row_number() over(partition by dt order by gmv desc) as gmv_rank
    from (
        select strftime('%Y-%m', order_timestamp) as dt
            , user_id
            , sum(price) as gmv
        from query_3 as orders
            inner join product_info
                on orders.product_id = product_info.product_id
        group by 1, 2
        )
    )
    
select *
from rank
where gmv_rank < 6
order by gmv_rank;
