WITH raw_movies AS(
    select * from MOVIELENS.RAW.raw_movies
)

select 
    movieId as movie_Id,
    title,
    genres
FROM raw_movies