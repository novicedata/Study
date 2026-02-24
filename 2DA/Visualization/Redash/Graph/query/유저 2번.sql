-- 구매까지 퍼널 단계 별 유저 수
-- 전환 이벤트: 화면 방문 단위 전환(visit, page)
-- 퍼널: checkout -> cart -> PDP -> PLP

select
    case when screen = 'home' then '1_home'
         when screen = 'plp' then '2_plp'
         when screen = 'pdp' then '3_pdp'
         when screen = 'cart' then '4_cart'
         when screen = 'checkout' then '5_checkout'
    end as screen_stage
    , count(*) as event_count
    , count(distinct user_id) as user_count
from query_5
where event_timestamp between '{{date.start}}' and '{{date.end}}'
    and event_type = 'visit' and object_type = 'page'
group by 1
order by 1;
