

--This test ensures that all order amounts are positive

Select
    movie_id,
    tag_id,
    relevance_score
From {{ref("fact_genome_scores")}}
where relevance_score<=0