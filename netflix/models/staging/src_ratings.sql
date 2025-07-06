WITH raw_ratings AS(
    select * from MOVIELENS.RAW.raw_ratings
)

select 
    userId as user_id,
    movieId as movie_id,
    rating,
    TO_TIMESTAMP_LTZ(timestamp) as rating_timestamp
FROM raw_ratings