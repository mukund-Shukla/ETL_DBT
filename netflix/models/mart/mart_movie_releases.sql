{{config(materialized='table')}}

with fact_ratinga as (
    select * from {{ref("fact_ratings")}}
),
seed_dates as (
    select * from {{ref("seed_movie_release_dates")}}
)
Select 
    f.*,
    CASE
        When d.release_date IS NULL THEN 'unknown'
        ELSE 'known'
    END AS release_info
From fact_ratings f
LEFT JOIN seed_dates d 
On f.movie_id=d.movie_id