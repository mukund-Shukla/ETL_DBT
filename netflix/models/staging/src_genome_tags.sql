WITH raw_genome_tags AS(
    select * from MOVIELENS.RAW.raw_genome_tags
)

select 
    tagId as tag_id,
    tag
FROM raw_genome_tags