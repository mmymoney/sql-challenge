-- Query 1: List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.firstname, employees.gender, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no

-- Query 2: List employees who were hired in 1986.

SELECT * 
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date < '1987-01-01'

-- Query 3: List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.firstname, department_managers.from_date, department_managers.to_date
FROM department_managers
JOIN employees ON employees.emp_no = department_managers.emp_no
JOIN departments ON department_managers.dept_no = departments.dept_no

-- Query 4: List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.firstname, departments.dept_name
FROM employees
JOIN department_employees ON employees.emp_no = department_employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no

-- Query 5: List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
WHERE firstname = 'Hercules'
AND last_name LIKE 'B*'

-- Query 6: List all employees in the Sales department, including their employee number, last name, first name, and department name.

-- Create View
CREATE VIEW sales_dept AS
	SELECT employees.emp_no, employees.last_name, employees.firstname, departments.dept_name
	FROM employees
	JOIN department_employees ON department_employees.emp_no = employees.emp_no
	JOIN departments on department_employees.dept_no = departments.dept_no

-- Select from View
SELECT *
FROM sales_dept
WHERE dept_name = 'Sales'

-- Query 7: List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- Create View
CREATE VIEW sales_development_depts AS
	SELECT employees.emp_no, employees.last_name, employees.firstname, departments.dept_name
	FROM employees
	JOIN department_employees ON department_employees.emp_no = employees.emp_no
	JOIN departments on department_employees.dept_no = departments.dept_no

-- Select from View
SELECT *
FROM sales_development_depts
WHERE dept_name = 'Sales' or dept_name = 'Development'

-- Query 8: In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC