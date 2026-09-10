# Analysis 1 — Overall Attrition

SELECT
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean;


# Analysis 2 — Attrition by Department

SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean
GROUP BY Department
ORDER BY attrition_rate DESC;

# Analysis 3 — Attrition by Job Role

SELECT 
    JobRole,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(100.0 * SUM(Attrition = 'Yes') / COUNT(*),
            2) AS attrition_rate
FROM
    employee_attrition_clean
GROUP BY JobRole
ORDER BY attrition_rate DESC;

# Analysis 4 — Overtime vs Attrition

SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean
GROUP BY OverTime
ORDER BY attrition_rate DESC;

# Analysis 5: Age vs Attrition

SELECT
    CASE
        WHEN Age < 25 THEN '< 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean
GROUP BY age_group
ORDER BY attrition_rate DESC;

# Analysis 6: Income vs Attrition

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN '< 3K'
        WHEN MonthlyIncome < 6000 THEN '3K - 6K'
        WHEN MonthlyIncome < 10000 THEN '6K - 10K'
        ELSE '10K+'
    END AS income_band,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean
GROUP BY income_band
ORDER BY attrition_rate DESC;

# Analysis 7: Tenure vs Attrition

SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN '< 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 5 THEN '2-5 years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 years'
        ELSE '10+ years'
    END AS tenure_group,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean
GROUP BY tenure_group
ORDER BY attrition_rate DESC;

# Analysis 8a: Satisfaction vs Attrition

SELECT
    EnvironmentSatisfaction,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

# Analysis 8B: Work-Life Balance

SELECT
    WorkLifeBalance,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

#Analysis 9 — Cross Analysis Job Role × Overtime

SELECT
    JobRole,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean
GROUP BY JobRole, OverTime
ORDER BY attrition_rate DESC;

# Analysis 10 — Job Level × Overtime

SELECT
    JobLevel,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    SUM(Attrition = 'No') AS employees_stayed,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition_clean
GROUP BY JobLevel, OverTime
ORDER BY JobLevel, OverTime;