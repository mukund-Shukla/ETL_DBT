with src_scores as (
    Select * from {{ref('src_genome_scores')}}
)

Select 
    movie_Id,
    tag_id,
    ROUND(relevance,4) AS relevance_score
From src_scores
Where relevance>0