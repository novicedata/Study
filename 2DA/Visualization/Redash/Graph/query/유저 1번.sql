-- 일/주 단위 재방문 유저수

with event_raw as (
    select distinct 
        strftime('%Y-%m-%d', event_timestamp) as dt
        , user_id
    from query_5
    where event_timestamp between '{{date.start}}' and '{{date.end}}'
)

, first_visit as (
    select user_id
        , min(dt) as min_dt
    from event_raw
    group by 1
)

select
    min_dt,
    julianday(event.dt) - julianday(min_dt) as diff,
    count(distinct event.user_id) as users
from first_visit as first
    left join event_raw as event
        on first.user_id = event.user_id
group by 1, 2
order by 1, 2;
