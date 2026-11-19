# Write your MySQL query statement below
WITH CTE AS (
    SELECT DISTINCT article_id, author_id, viewer_id, view_date
    FROM Views
    ORDER BY author_id
)
SELECT DISTINCT author_id as id
FROM Views
WHERE author_id = viewer_id
ORDER BY id
