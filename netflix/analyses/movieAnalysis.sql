with ratings_summary AS(
    Select
        movie_id,
        AVG(rating) AS avg_rating,
        COUNT(*) AS total_ratings
    From {{ref('fact_ratings')}}
    Group by movie_id
    HAVING COUNT(*)>100  --Only movies with atleast 100 ratings
)

Select
    m.movie_title,
    rs.avg_rating,
    rs.total_ratings
From ratings_summary rs
JOIN {{ref("dim_movies")}} m on rs.movie_id=m.movie_id
Order by rs.avg_rating DESC
LIMIT 20; 

-- Distribution of ratings across different genres
SELECT
  genre,
  AVG(rating) AS average_rating,
  COUNT(DISTINCT movie_id) AS total_movies
FROM {{ ref('dim_movies_with_tags') }} m
JOIN {{ ref('fact_ratings') }} r ON m.movie_id = r.movie_id
CROSS JOIN UNNEST(m.genre_array) AS genre
GROUP BY genre ORDER BY average_rating DESC;


-- Number of ratings given per user
SELECT
  user_id,
  AVG(rating) AS average_rating_given,
  COUNT(*) AS number_of_ratings
FROM {{ ref('fact_ratings') }}
GROUP BY user_id ORDER BY number_of_ratings DESC;


-- Trend of movie releases over time
SELECT
    EXTRACT(year FROM release_date) AS release_year,
    COUNT(DISTINCT movie_id) AS movies_released
FROM {{ ref('seed_movie_release_dates') }}
GROUP BY release_year ORDER BY release_year ASC;


--  Tag Relevance Analysis
SELECT
    t.tag_name, AVG(gs.relevance_score) AS avg_relevance,
    COUNT(DISTINCT gs.movie_id) AS movies_tagged
FROM {{ ref('fact_genome_scores') }} gs
JOIN {{ ref('dim_genome_tags') }} t ON gs.tag_id = t.tag_id
GROUP BY t.tag_name ORDER BY avg_relevance DESC
LIMIT 20;