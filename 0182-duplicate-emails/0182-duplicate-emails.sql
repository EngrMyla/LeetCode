# Write your MySQL query statement below
SELECT 
    distinct email
FROM Person
GROUP BY email
HAVING count(email) > 1