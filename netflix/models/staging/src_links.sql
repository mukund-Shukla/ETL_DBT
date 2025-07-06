WITH raw_links AS(
    select * from MOVIELENS.RAW.raw_links
)

select 
    movieId as movie_id,
    imdbId as imdb_id,
    tmdbId as tmdb_id
FROM raw_links