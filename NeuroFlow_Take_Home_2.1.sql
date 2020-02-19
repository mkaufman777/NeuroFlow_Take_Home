/*
Take Home Part 2, Question 1. How many users completed an exercise in their first month
per monthly cohort?
*/

SELECT monthly_cohort,
(COUNT(DISTINCT CASE
	WHEN num_ex_complete_same_month > 0 THEN user_id
	END)/ COUNT(DISTINCT user_id))*100.0 AS initial_completion_percent_same_month	
FROM(
	SELECT user_id, MONTH(created_at) AS monthly_cohort, 
	SUM(CASE 
		WHEN MONTH(exercise_completion_date) = MONTH(creation_date) THEN 1 
		ELSE 0 
		END) AS num_ex_complete_same_month
	FROM users 
	LEFT JOIN exercises ON users.user_id = exercises.user_id
	WHERE exercise_completion_date IS NOT NULL
	GROUP BY MONTH(created_at), user_id
	)	
GROUP BY monthly_cohort