
with fact_movie_with_tags as (
    select * from {{ ref('dim_movies_with_tags') }}
)

select * from fact_movie_with_tags
