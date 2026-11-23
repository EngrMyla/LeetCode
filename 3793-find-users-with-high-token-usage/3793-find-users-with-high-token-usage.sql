# Write your MySQL query statement below
with ave_tokens as (
    select distinct user_id,
        max(tokens) as max_token,
        avg(tokens) as ave_token
    from prompts
    group by user_id
)
select
    p.user_id,
    count(p.prompt) as prompt_count,
    ROUND(avg(p.tokens), 2) as avg_tokens
from prompts p
JOIN ave_tokens a
ON p.user_id = a.user_id
GROUP BY p.user_id, a.max_token, a.ave_token
HAVING a.max_token > a.ave_token
    AND count(p.prompt) >= 3
ORDER BY avg_tokens DESC