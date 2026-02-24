-- 월 별 데모 정보 별 방문 유저 수

with user_info as (
    select
        user_id, gender, age
        , case when age < 20 then '0_19'
               when age between 20 and 29 then '20_29'
               when age between 30 and 39 then '30_39'
               when age between 40 and 49 then '40_49'
               when age between 50 and 59 then '50_59'
               when age >= 60 then '60+'
         end as age_group
    from query_4
)

, event as (
    select strftime('%Y-%m', event_timestamp) as dt
        , user_id
        , count(*) as event_count
    from query_5
    group by 1, 2
)

select dt
    , gender
    , age_group
    , count(distinct event.user_id) as user_count
from event
    left join user_info
        on event.user_id = user_info.user_id
group by 1, 2, 3
order by 1, 2, 3;
