DELETE FROM educational_attainment;
LOAD DATA LOCAL INFILE 'c:/ca_pop_educational_attainment.csv' 
INTO TABLE educational_attainment 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@var1, Age, Gender, EducationAttainment, PersonalIncome, PopulationCount) 
SET Year = STR_TO_DATE(@var1, '%m/%d/%Y');  