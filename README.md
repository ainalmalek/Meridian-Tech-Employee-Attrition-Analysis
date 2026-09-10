# Meridian Tech — Employee Attrition & Workforce Analysis

## 🏢 About Meridian Tech Group

**Meridian Tech Group** is a technology company that provides digital solutions, IT services, and business technology support to organizations across multiple industries. As the company grows, maintaining a stable and productive workforce becomes increasingly important.

This project analyzes employee demographics, job characteristics, compensation, job satisfaction, overtime, and other workforce factors to identify **employee attrition patterns and potential retention risks**.

---

## 📌 Project Overview

Employee attrition can affect workforce stability, recruitment costs, productivity, and business continuity.

This project analyzes employee-level workforce data to identify:

- The overall level of employee attrition
- Departments and job roles with higher attrition
- The relationship between overtime and attrition
- Attrition patterns across age groups and employee tenure
- The relationship between income and attrition
- The relationship between employee satisfaction and attrition
- Whether overtime-related attrition varies across job roles and job levels

The analysis was designed to answer practical HR and workforce-management questions rather than simply describe the dataset.

> **Note:** Meridian Tech is a fictional company created for portfolio purposes.

---

## 🎯 Business Questions

The analysis was structured around the following key business questions:

1. **How high is employee attrition at Meridian Tech?**
2. **Which departments have the highest attrition?**
3. **Which job roles are most at risk of attrition?**
4. **Does overtime relate to employee attrition?**
5. **Does employee age relate to attrition?**
6. **Does income level relate to attrition?**
7. **Does employee tenure relate to attrition?**
8. **Does employee satisfaction relate to attrition?**

### Cross-Analysis

To investigate potential interactions between workforce factors, two additional analyses were performed:

9. **Which job roles show higher attrition among employees working overtime?**
10. **Does the relationship between overtime and attrition vary by job level?**

---

## 📂 Dataset

**Source:** Kaggle — Employee Attrition and Retention Analytics Dataset

### Raw Dataset

- **1,484 rows**
- **35 columns**
- Employee-level workforce data
- Contains demographic, job, compensation, satisfaction, tenure, and attrition information

The raw dataset was intentionally used as the starting point for a realistic data-cleaning workflow.

### Key Data Quality Issues Identified

The raw dataset contained:

- **359 missing-value cells** across 11 columns
- **4 exact duplicate rows**
- **14 duplicated EmployeeNumber records**
- Inconsistent categorical values and spelling
- Missing values in both categorical and numerical fields
- Constant fields such as `Over18` and `StandardHours`

---

# 🔄 Project Workflow

```text
Raw CSV
   ↓
Excel / Power Query
   ↓
Data Cleaning & Quality Checks
   ↓
Cleaned CSV
   ↓
MySQL
   ↓
SQL Validation
   ↓
SQL Business Analysis
   ↓
Power BI
   ↓
DAX Measures & Dashboard
   ↓
Key Findings
   ↓
Business Recommendations
```
---

# 🧹 1. Data Cleaning — Excel & Power Query

The raw dataset was cleaned using **Microsoft Excel Power Query** before being loaded into MySQL.

The objective was not simply to remove all missing values, but to apply appropriate treatment based on the type and context of each data-quality issue.

### Missing-Value Treatment

| Column | Issue | Treatment |
|---|---|---|
| `Department` | 41 missing | Inferred using `JobRole = Product Manager` where applicable |
| `JobRole` | 25 missing | Standardized values; unrecoverable records retained as `Unknown` |
| `Gender` | 16 missing / inconsistent values | Standardized to `Male`, `Female`, and `Unknown` |
| `DailyRate` | 30 missing | Median imputation by `JobLevel` |
| `MonthlyIncome` | 40 missing | Median imputation by `JobLevel` |
| `EducationField` | 38 missing | `Unknown` |
| `MaritalStatus` | 20 missing | `Unknown` |
| `EnvironmentSatisfaction` | 38 missing | `0 = Missing/Unknown` |
| `WorkLifeBalance` | 31 missing | `0 = Missing/Unknown` |
| `OverTime` | 25 missing | `Unknown` |
| `NumCompaniesWorked` | 15 missing | Median imputation by `JobLevel` |

### Other Cleaning Activities

- Trimmed and standardized categorical values
- Corrected inconsistent capitalization and spelling
- Standardized department names
- Corrected malformed gender values
- Standardized job-role naming
- Removed helper/reference queries from the final output
- Preserved the original raw dataset separately
- Exported the final cleaned dataset as UTF-8 CSV
---

# 🗄️ 2. SQL — MySQL

The cleaned dataset was imported into **MySQL** for validation and business analysis.

### Database

```sql
CREATE DATABASE meridian_tech;
USE meridian_tech;
```

### Main Analysis Table

```text
employee_attrition_clean
```

The original imported table was preserved separately, while the analysis table was used for duplicate handling and final analysis.

### Data Validation

Validation checks were performed for:

- Null values
- Duplicate EmployeeNumber records
- Employee counts
- Attrition values
- Department values
- Gender values
- Overtime values
- Satisfaction ratings
- Work-life balance ratings
- Age ranges
- Income ranges

After cleaning and duplicate resolution:

> **Final dataset: 1,470 employees**

All key validation checks returned **0 unexpected nulls** in the validated analysis fields.

---

# 📊 3. SQL Business Analysis

A total of **10 SQL analyses** were performed.

### Analysis 1 — Overall Attrition

```text
Total Employees: 1,470
Employees Left: 433
Employees Stayed: 1,037
Attrition Rate: 29.46%
```

---

### Analysis 2 — Attrition by Department

After standardizing `Data And Analytics` into `Data & Analytics`, the department analysis showed:

- **Sales:** 34.03%
- **Human Resources:** 33.65%
- **Engineering:** 29.32%
- **Data & Analytics:** 28.48%
- **Customer Support:** 27.46%
- **Product:** 26.87%
- **Marketing:** 26.77%
- **IT Operations:** 24.64%

Sales recorded the highest department-level attrition.

---

### Analysis 3 — Attrition by Job Role

The highest observed job-role attrition rates included:

| Job Role | Employees | Attrition Rate |
|---|---:|---:|
| Sales Executive | 79 | **46.84%** |
| Data Analyst | 40 | **40.00%** |
| Talent Acquisition Specialist | 38 | **39.47%** |
| Content Strategist | 44 | **38.64%** |
| Support Team Lead | 52 | **38.46%** |
| Data Engineer | 46 | **36.96%** |
| Product Manager | 55 | **36.36%** |

Sales Executive recorded the highest overall job-role attrition.

---

### Analysis 4 — Overtime vs Attrition

| Overtime | Employees | Attrition Rate |
|---|---:|---:|
| No | 987 | 24.82% |
| Yes | 458 | **39.96%** |
| Unknown | 25 | 20.00% |

Employees working overtime had an attrition rate **15.14 percentage points higher** than employees without overtime.

---

### Analysis 5 — Age vs Attrition

| Age Group | Employees | Attrition Rate |
|---|---:|---:|
| < 25 | 196 | **40.31%** |
| 25–34 | 610 | 29.02% |
| 35–44 | 546 | 26.56% |
| 45–54 | 114 | 27.19% |
| 55+ | 4 | 25.00% |

Employees under 25 recorded the highest attrition rate.

---

### Analysis 6 — Income vs Attrition

| Income Band | Employees | Attrition Rate |
|---|---:|---:|
| < RM3K | 122 | **31.97%** |
| RM3K–6K | 599 | 29.72% |
| RM6K–10K | 344 | 29.65% |
| RM10K+ | 405 | 28.15% |

The difference between the highest and lowest income-band attrition rates was relatively small at **3.82 percentage points**.

---

### Analysis 7 — Tenure vs Attrition

| Tenure | Employees | Attrition Rate |
|---|---:|---:|
| < 2 years | 349 | **38.11%** |
| 2–5 years | 386 | 32.12% |
| 6–10 years | 360 | 24.72% |
| 10+ years | 375 | 23.20% |

Employees with less than two years of tenure recorded substantially higher attrition than long-tenured employees.

---

### Analysis 8 — Satisfaction vs Attrition

#### Environment Satisfaction

The lowest satisfaction rating (`1`) recorded the highest attrition among the valid ratings:

- Rating 1: **32.98%**
- Rating 2: 26.05%
- Rating 3: 28.80%
- Rating 4: 30.57%

The relationship was not consistently linear, suggesting that environment satisfaction alone does not fully explain attrition.

#### Work-Life Balance

- Rating 1: **30.77%**
- Rating 2: 28.21%
- Rating 3: 30.08%
- Rating 4: **26.52%**

Employees with the highest work-life balance rating had the lowest observed attrition, although the relationship was not perfectly linear.

---

### Analysis 9 — Job Role × Overtime

Several job roles showed substantially higher attrition among employees working overtime.

Examples:

| Job Role | Overtime | Attrition Rate |
|---|---|---:|
| Data Analyst | Yes | **64.29%** |
| Sales Executive | Yes | **58.33%** |
| BI Analyst | Yes | **54.55%** |
| Software Engineer | Yes | **48.72%** |
| Support Team Lead | Yes | **46.15%** |
| DevOps Engineer | Yes | **45.45%** |
| Senior Software Engineer | Yes | **43.48%** |

For Data Analysts specifically:

```text
Overtime Yes → 64.29%
Overtime No  → 28.00%
Difference   → +36.29 percentage points
```

However, the relationship varied by role. For example, Data Engineers showed higher attrition among employees **without** overtime.

This indicates that overtime should not be treated as a universal explanation for attrition.

---

### Analysis 10 — Job Level × Overtime

Overtime was associated with higher attrition across **every Job Level**.

| Job Level | Overtime No | Overtime Yes |
|---|---:|---:|
| 1 | 26.97% | **41.61%** |
| 2 | 25.09% | **37.69%** |
| 3 | 22.05% | **43.93%** |
| 4 | 25.24% | **30.61%** |
| 5 | 21.59% | **42.86%** |

The largest difference was observed at **Job Level 3**, where attrition was:

**43.93% with overtime vs 22.05% without overtime.**

This suggests that overtime-related attrition risk is not limited to junior employees.

---

# 📈 4. Power BI Dashboard

The cleaned MySQL dataset was connected to **Power BI Desktop** for interactive reporting.

### KPI Measures

The dashboard includes:

- **Total Employees**
- **Employees Left**
- **Employees Stayed**
- **Attrition Rate**

### Page 1 — Executive Overview

<img width="2066" height="1158" alt="Meridian 1" src="https://github.com/user-attachments/assets/cb0b7924-dbad-4cce-b8dd-2be68927035f" />


Focus:

> **What is happening with employee attrition?**

Key visuals:

- KPI cards
- Attrition by Department
- Attrition by Job Role
- Attrition by Age Group
- Attrition by Tenure

---

### Page 2 — Attrition Drivers

<img width="2068" height="1164" alt="Meridian 2" src="https://github.com/user-attachments/assets/deb5f254-3beb-412f-9211-6675dee14fad" />


Focus:

> **What factors are associated with employee attrition?**

Key visuals:

- Overtime vs Attrition
- Job Level vs Attrition
- Income Band vs Attrition
- Environment Satisfaction vs Attrition
- Work-Life Balance vs Attrition

---

### Page 3 — Risk Deep Dive

<img width="2066" height="1162" alt="Meridian 3" src="https://github.com/user-attachments/assets/96b38c95-ee7d-4a75-a10c-c42ee7c97b58" />


Focus:

> **Which employee groups require greater attention?**

Key visuals:

- Job Role × Overtime
- Job Level × Overtime
- High-risk job roles
- Workforce risk comparisons
- Key insight summary

---

# 💡 Key Findings

### 1. Overall Attrition is 29.46%

Meridian Tech recorded an overall attrition rate of **29.46%**, with **433 out of 1,470 employees** leaving the organization.

### 2. Sales Executive is the Highest-Risk Job Role

Sales Executives recorded the highest job-role attrition rate at **46.84%**, with 37 out of 79 employees leaving.

### 3. Overtime is Strongly Associated with Attrition

Employees working overtime recorded **39.96% attrition**, compared with **24.82%** among employees without overtime.

This represents a **15.14 percentage-point difference**.

### 4. Early-Tenure Employees are Higher Risk

Employees with less than two years of tenure recorded **38.11% attrition**, compared with **23.20%** among employees with 10+ years of tenure.

### 5. Younger Employees Show Higher Attrition

Employees under 25 recorded the highest age-group attrition at **40.31%**, compared with **29.02%** among employees aged 25–34.

### 6. Overtime Risk Appears Across Job Levels

Overtime employees recorded higher attrition across every Job Level. The largest gap occurred at Job Level 3:

**43.93% with overtime vs 22.05% without overtime.**

---

# 🎯 Business Impact & Recommendations

Based on the analysis, Meridian Tech should focus retention efforts on workforce groups showing consistently higher observed attrition.

### 1. Review Overtime and Workload

**Finding:** Overtime employees recorded significantly higher attrition.

**Recommendation:**

- Monitor overtime frequency by department and role
- Review workload distribution
- Identify teams with persistent overtime
- Assess staffing capacity
- Consider workload redistribution where appropriate

---

### 2. Strengthen Early-Tenure Retention

**Finding:** Employees with less than two years of tenure showed considerably higher attrition.

**Recommendation:**

- Strengthen onboarding programs
- Introduce 30/60/90-day check-ins
- Establish mentoring programs
- Provide clearer career-development pathways
- Monitor employee engagement during the first two years

---

### 3. Focus on High-Risk Job Roles

**Finding:** Sales Executive recorded the highest overall job-role attrition.

**Recommendation:**

- Review workload and performance expectations
- Investigate compensation and incentive structures
- Improve career progression opportunities
- Conduct targeted exit interviews
- Monitor role-specific attrition trends

---

### 4. Pay Attention to Younger Employees

**Finding:** Employees under 25 recorded the highest age-group attrition.

**Recommendation:**

- Strengthen early-career development
- Provide mentorship
- Improve career guidance
- Establish clear progression opportunities
- Monitor workload and work-life balance

---

### 5. Use a Targeted Rather Than Blanket Retention Strategy

The analysis shows that attrition patterns vary across employee groups.

For example, overtime was strongly associated with attrition in several roles, but not every role showed the same pattern.

Therefore, retention initiatives should combine:

```text
Job Role
   +
Overtime
   +
Job Level
   +
Tenure
   +
Age
```

rather than relying on a single factor.

> **Important:** These findings identify associations within the dataset and should not be interpreted as proof of causation.

---

# 🛠️ Tools & Skills Demonstrated

### Data Cleaning & Preparation

- Microsoft Excel
- Power Query
- Missing-value treatment
- Data standardization
- Duplicate detection
- Data validation
- Median imputation
- Data quality assessment

### SQL

- MySQL
- SELECT
- WHERE
- GROUP BY
- CASE
- Aggregate functions
- Conditional aggregation
- `COUNT()`
- `SUM()`
- `ROUND()`
- Business-oriented SQL analysis
- Cross-analysis
- Data validation

### Power BI

- Power BI Desktop
- MySQL data connection
- Data modelling
- DAX measures
- KPI cards
- Interactive dashboards
- Data visualization
- Business storytelling

### Analytical Skills

- Exploratory analysis
- Segmentation
- Trend and pattern identification
- Comparative analysis
- Business impact analysis
- Data-driven recommendations

---

# 🚀 Conclusion

This project demonstrates an end-to-end approach to HR analytics, moving from **raw and imperfect data to actionable business insights**.

The analysis identified several groups with higher observed attrition, particularly:

- Sales Executives
- Employees working overtime
- Employees with less than two years of tenure
- Employees under 25
- Certain job-role and overtime combinations

Rather than assuming a single cause of employee turnover, the project combines multiple workforce dimensions to identify where retention risks appear strongest.

The final Power BI dashboard translates the SQL analysis into an interactive business-reporting experience that allows stakeholders to explore employee attrition from multiple perspectives.

---

### 🔎 Project Workflow Summary

```text
Excel / Power Query
        ↓
Data Cleaning
        ↓
MySQL
        ↓
Data Validation
        ↓
SQL Business Analysis
        ↓
Power BI
        ↓
DAX & Dashboard
        ↓
Insights
        ↓
Business Recommendations
```
