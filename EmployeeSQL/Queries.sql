-- #1 - List employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary

FROM employees, salaries

WHERE employees.emp_no = salaries.emp_no

ORDER BY emp_no ASC

-- #2 - List employees who were hired in 1986.

SELECT * FROM employees
WHERE hire_date BETWEEN '12/31/85' and '1/1/87'

-- #3 - List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name, 
dept_manager.from_date, dept_manager.to_date

FROM dept_manager, departments, employees

WHERE employees.emp_no = dept_manager.emp_no and departments.dept_no = dept_manager.dept_no

-- #4 - List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name

FROM employees, departments, dept_emp

WHERE employees.emp_no = dept_emp.emp_no and departments.dept_no = dept_emp.dept_no

-- #5 - List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
from employees
where first_name = 'Hercules' and last_name LIKE 'B%'

-- #6 - List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name

FROM employees, departments, dept_emp

WHERE employees.emp_no = dept_emp.emp_no and departments.dept_no = dept_emp.dept_no and departments.dept_name = 'Sales'

-- #7 - List all employees in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.

-- SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name

-- FROM employees, departments, dept_emp

-- WHERE employees.emp_no = dept_emp.emp_no and departments.dept_no = dept_emp.dept_no and 
-- departments.dept_name = 'Sales' or departments.dept_name = 'Development' 


-- #8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT employees.last_name, count(employees.last_name)

FROM employees

GROUP BY employees.last_name

ORDER BY count(employees.last_name)desc;