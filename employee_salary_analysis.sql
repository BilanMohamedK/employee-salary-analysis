-- =====================================================
-- EMPLOYEE SALARY ANALYSIS PROJECT
-- =====================================================

-- PROJECT GOAL:
-- Identify factors associated with salary differences across departments, roles,
-- and employee demographics.

-- =====================================================
-- 1. DATA EXPLORATION
-- Purpose: Understand structure and contents of raw datasets
-- =====================================================

SELECT * 
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- =====================================================
-- 2. DATA INTEGRATION (EMPLOYEE PROFILE CREATION)
-- Purpose: Combine demographic and salary data into a single analytical dataset
-- =====================================================

SELECT *
FROM employee_demographics AS d
JOIN employee_salary AS s
ON d.employee_id = s.employee_id;

-- =====================================================
-- 3. SALARY ANALYSIS
-- Purpose: Explore how salary varies across key workforce dimensions
-- =====================================================

-- Average salary by department
SELECT s.dept_id, AVG(s.salary) AS avg_salary
FROM employee_salary AS s
GROUP BY s.dept_id
ORDER BY avg_salary DESC;

-- Average salary by occupation
SELECT occupation, AVG(salary) AS avg_salary
FROM employee_salary
GROUP BY occupation
ORDER BY avg_salary DESC;

-- Average salary by age
SELECT d.age, AVG(s.salary) AS avg_salary
FROM employee_salary AS s
JOIN employee_demographics AS d
ON d.employee_id = s.employee_id
GROUP BY d.age
ORDER BY d.age ASC;

-- =====================================================
-- 4. SALARY DISTRIBUTION (TOP EARNERS)
-- Purpose: Identify highest-paid employees and their roles
-- =====================================================

SELECT 
    d.first_name,
    s.dept_id,
    s.occupation,
    s.salary
FROM employee_salary AS s
JOIN employee_demographics AS d
ON d.employee_id = s.employee_id
ORDER BY s.salary DESC
LIMIT 5;
