# Question 10
SELECT 
temp_pop.Year year, 
temp_pop.age age,
d.age as age_range, 
d.educationattainment,
d.coefficient,
round(sum(temp_pop.total_pop * d.coefficient)) as demand
FROM 
(
(SELECT YEAR, age, SUM(pop_total) total_pop 
FROM pop_proj GROUP BY YEAR, age) temp_pop
JOIN demographics d ON  
CASE d.age 
	WHEN temp_pop.age < 18 THEN '00 to 17' 
	WHEN temp_pop.age > 64 THEN '65 to 80+' 
	ELSE '18 to 64' 
END
)
GROUP BY temp_pop.`YEAR`, d.educationattainment;







