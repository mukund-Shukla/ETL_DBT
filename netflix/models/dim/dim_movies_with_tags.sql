{{
    config(
        materialized='ephemeral'
    )
}}

with movies AS(
    Select * from {{ref("dim_movies")}}
),
tags AS(
    Select * from {{ref("dim_genome_tags")}}
),
scores AS(
    select * from {{ref("fact_genome_scores")}}
)

Select
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag_name,
    s.relevance_score

From movies m
LEFT JOIN scores s on m.movie_id=s.movie_id
LEFT JOIN tags t on t.tag_id=s.tag_id
