with src_movies as (
    Select * from {{ref('src_movies')}}
)

select
    movie_Id,
    INITCAP(TRIM(title)) AS movie_title,
    SPLIT(genres,'|') As genre_array,
    genres
from src_movies