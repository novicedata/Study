select
    *,
    -- ctr, 인당 상품 클릭 수
    100.0*click_count/impression_count as ctr,
    1.0*click_count/click_user as click_per_user
from(
    select test_group,
         -- 노출 수, 클릭 수, 노출 유저수, 클릭 유저수
         sum(case when event_type = 'impression' then 1 else 0 end) as impression_count,
         sum(case when event_type = 'click' then 1 else 0 end) as click_count,
         count(distinct case when event_type = 'impression' then user_id end) as impression_user,
         count(distinct case when event_type = 'click' then user_id end) as click_user
    from query_6
    group by test_group
)
