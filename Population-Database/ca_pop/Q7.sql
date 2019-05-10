/* Use the query from Step 6 as a subquery to find each type of education attained by the population in that age group and the fraction of the population of that age group that has that educational attainment. Label the fraction column output as coefficient. For instance, the fraction of the population in age group 00 - 17 who has an education attainment of Bachelor's degree or higher is 0.0015, which is the coefficient. */

SELECT age, educationattainment, SUM(PopulationCount) / 
(SELECT res1.total_pop FROM 
(SELECT age, SUM(PopulationCount) total_pop FROM educational_attainment 
GROUP BY age
) res1
WHERE age = '00 to 17') coefficient
FROM educational_attainment
WHERE age = '00 to 17'
GROUP BY educationattainment;


SELECT age, educationattainment, SUM(PopulationCount) / 
(SELECT res1.total_pop FROM 
(SELECT age, COUNT(*) total_pop FROM educational_attainment 
GROUP BY age
) res1
WHERE age = '18 to 64') coefficient

FROM educational_attainment
WHERE age = '18 to 64'
GROUP BY educationattainment;

SELECT age, educationattainment, SUM(PopulationCount) / 
(SELECT res1.total_pop FROM 
(SELECT age, SUM(PopulationCount) total_pop FROM educational_attainment 
GROUP BY age
) res1
WHERE age = '65 to 80+') coefficient

FROM educational_attainment
WHERE age = '65 to 80+'
GROUP BY educationattainment;

