WITH ratings AS (
    Select DISTINCT user_id from {{ref("src_ratings")}}
),
tags AS (
    Select DISTINCT user_id from {{ref("src_tags")}}
)
Select DISTINCT user_id 
from (
    Select * from ratings
    UNION
    Select * from tags
)
