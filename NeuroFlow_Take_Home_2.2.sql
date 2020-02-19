/*
Take Home Part 2, Question 2. Which organizations have the most severe patient population?
*/

SELECT organization_name, AVG(score) AS avg_score, COUNT(score) AS num_patients
FROM Providers prov 
JOIN Phq9 ph ON ph.provider_id = prov.provider_id
GROUP BY organization_name
ORDER BY AVG(score) DESC
LIMIT 5