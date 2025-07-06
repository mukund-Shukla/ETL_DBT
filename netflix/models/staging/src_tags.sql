{{
    config(
        materialized='table'
    )
}}

WITH raw_tags AS(
    select * from MOVIELENS.RAW.raw_tags
)

select 
    userId as user_id,
    movieId as movie_id,
    tag,
    TO_TIMESTAMP_LTZ(timestamp) AS tag_timestamp
FROM raw_tags