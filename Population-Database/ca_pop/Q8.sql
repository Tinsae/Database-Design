DROP TABLE demographics;
CREATE TABLE demographics
(
SELECT age, educationattainment, SUM(PopulationCount) / 
(SELECT res1.total_pop FROM 
(SELECT age, SUM(PopulationCount) total_pop FROM educational_attainment 
GROUP BY age
) res1
WHERE age = '00 to 17') coefficient
FROM educational_attainment
WHERE age = '00 to 17'
GROUP BY educationattainment
)
UNION
(
SELECT age, educationattainment, SUM(PopulationCount) / 
(SELECT res1.total_pop FROM 
(SELECT age, SUM(PopulationCount) total_pop FROM educational_attainment 
GROUP BY age
) res1
WHERE age = '18 to 64') coefficient
FROM educational_attainment
WHERE age = '18 to 64'
GROUP BY educationattainment
)
UNION
(
SELECT age, educationattainment, SUM(PopulationCount) / 
(SELECT res1.total_pop FROM 
(SELECT age, SUM(PopulationCount) total_pop FROM educational_attainment 
GROUP BY age
) res1
WHERE age = '65 to 80+') coefficient
FROM educational_attainment
WHERE age = '65 to 80+'
GROUP BY educationattainment
);
