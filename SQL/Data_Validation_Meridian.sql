# Create a database
CREATE DATABASE meridian_tech;
USE meridian_tech;

# Check table

SELECT *
FROM employee_attrition
LIMIT 10;

# Check total employees

SELECT COUNT(*) AS total_employees
FROM employee_attrition;

# Change column name

ALTER TABLE employee_attrition
RENAME COLUMN ï»¿EmployeeNumber to EmployeeNumber;

# check duplicate rows

SELECT
	EmployeeNumber,
    COUNT(*) AS duplicate_count
FROM employee_attrition
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

# check duplicate rows details

SELECT *
FROM employee_attrition
WHERE EmployeeNumber IN (
	639, 548, 158, 55, 643, 710, 1387,
    865, 267, 945, 315, 450, 1195, 1157
    
)
ORDER BY EmployeeNumber;

# Create a clean dataset

CREATE TABLE employee_attrition_clean AS
SELECT DISTINCT *
FROM employee_attrition;

# check duplicate

SELECT
    EmployeeNumber,
    COUNT(*) AS duplicate_count
FROM employee_attrition_clean
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS total_rows
FROM employee_attrition_clean;

SELECT *
FROM employee_attrition
WHERE EmployeeNumber IN (
	639, 1387, 267, 1195, 1157
   
)
ORDER BY EmployeeNumber;

SELECT
    EmployeeNumber,
    COUNT(*) AS duplicate_count
FROM employee_attrition_clean
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1
ORDER BY EmployeeNumber;

SET SQL_SAFE_UPDATEs = 0;

# delete row

DELETE FROM employee_attrition_clean
WHERE EmployeeNumber = 267
  AND EducationField = 'Unknown';
  
SELECT *
FROM employee_attrition_clean
WHERE EmployeeNumber = 267;


DELETE FROM employee_attrition_clean
WHERE EmployeeNumber = 639
  AND EducationField = 'Unknown';
  
  DELETE FROM employee_attrition_clean
WHERE EmployeeNumber = 1387
  AND EnvironmentSatisfaction = 0;
  
  SELECT 
    EmployeeNumber, COUNT(*) AS duplicate_count
FROM
    employee_attrition_clean
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1
ORDER BY EmployeeNumber;

SELECT *
FROM employee_attrition
WHERE EmployeeNumber IN (
	1195, 1157
   
)
ORDER BY EmployeeNumber;

  DELETE FROM employee_attrition_clean
WHERE EmployeeNumber = 1195
  AND EnvironmentSatisfaction = 0;
  
    DELETE FROM employee_attrition_clean
WHERE EmployeeNumber = 1157
  AND EnvironmentSatisfaction = 0;
  
    SELECT 
    EmployeeNumber, COUNT(*) AS duplicate_count
FROM
    employee_attrition_clean
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1
ORDER BY EmployeeNumber;

SET SQL_SAFE_UPDATEs = 1;

SELECT COUNT(*) AS total_rows
FROM employee_attrition_clean;

# check null

SELECT
    COUNT(*) AS total_rows,
    SUM(EmployeeNumber IS NULL) AS EmployeeNumber_NULL,
    SUM(Age IS NULL) AS Age_NULL,
    SUM(Attrition IS NULL) AS Attrition_NULL,
    SUM(Department IS NULL) AS Department_NULL,
    SUM(JobRole IS NULL) AS JobRole_NULL,
    SUM(EducationField IS NULL) AS EducationField_NULL,
    SUM(MonthlyIncome IS NULL) AS MonthlyIncome_NULL,
    SUM(NumCompaniesWorked IS NULL) AS NumCompaniesWorked_NULL,
    SUM(OverTime IS NULL) AS OverTime_NULL,
    SUM(EnvironmentSatisfaction IS NULL) AS EnvironmentSatisfaction_NULL,
    SUM(WorkLifeBalance IS NULL) AS WorkLifeBalance_NULL
FROM employee_attrition_clean;

SELECT DISTINCT Attrition
FROM employee_attrition_clean;

SELECT DISTINCT Gender
FROM employee_attrition_clean;

SELECT DISTINCT Department
FROM employee_attrition_clean;

SELECT DISTINCT OverTime
FROM employee_attrition_clean;

SELECT DISTINCT EnvironmentSatisfaction
FROM employee_attrition_clean
ORDER BY EnvironmentSatisfaction;

SELECT DISTINCT WorkLifeBalance
FROM employee_attrition_clean
ORDER BY WorkLifeBalance;

# check data for age range

SELECT
    MIN(Age) AS min_age,
    MAX(Age) AS max_age
FROM employee_attrition_clean;

# check data for monthly income range

SELECT															
    MIN(MonthlyIncome) AS min_income,
    MAX(MonthlyIncome) AS max_income
FROM employee_attrition_clean;

SET SQL_SAFE_UPDATEs = 0;

# update format text

UPDATE employee_attrition_clean
SET Department = 'Data & Analytics'
WHERE Department = 'Data And Analytics';

SET SQL_SAFE_UPDATEs = 1;
