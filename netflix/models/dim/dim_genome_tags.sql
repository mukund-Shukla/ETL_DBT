with src_tags AS (
    Select * from {{ref("src_genome_tags")}}
)

Select
    tag_id,
    INITCAP(TRIM(tag)) AS tag_name
from src_tags