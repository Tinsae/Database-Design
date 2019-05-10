/* Write a query to select the total population in each age group.*/

SELECT age, SUM(PopulationCount) total_pop FROM educational_attainment GROUP BY age;
