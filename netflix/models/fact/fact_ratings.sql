{{
    config(
        materialized='incremental',
        on_schema_changes='fail'
    )
}}

with src_ratings AS (
    Select * from {{ref("src_ratings")}}
)

Select
    user_id,
    movie_Id,
    rating,
    rating_timestamp
From src_ratings
Where rating is not null


{% if is_incremental() %}
    AND rating_timestamp>(Select MAX(rating_timestamp)) From {{this}}
{% endif %} 