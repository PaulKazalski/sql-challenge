-- 'departments': dept_no, dept_name
-- 'dept_emp': emp_no, dept_no, from_date, to_date
-- 'dept_managers': dept_no, emp_no, from_date, to_date
-- 'employees': emp_no, birth_date, first_name, last_name, gender, hire_date
-- 'salaries': emp_no, salary, from_date, to_date
-- 'titles': emp_no, title, from_date, to_date

-- 1. Select emp_id, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
-- 3. List the manager of each department with the following information: department number, 
--    department name, the manager's emmployee number, last name, first name,
--    start date and end date (employment)
SELECT dept_managers.emp_no, employees.last_name, employees.first_name, 
dept_managers.from_date, dept_managers.to_date
FROM dept_managers
INNER JOIN employees ON
dept_managers.emp_no = employees.emp_no

-- 4. List the department of each employee with the following information: employee number, 
--    last name, first name, and department name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, 
employees.first_name, dept_emp.dept_no FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
group by departments.dept_name, employees.emp_no, dept_emp.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, 
--    first name, and department name.
select * from dept_emp
Inner join employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007'
;
-- 7. List all employees in the Sales and Development departments, including their employee number, 
--    last name, first name, and department name.
select * from dept_emp
Inner join employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007'
OR departments.dept_no = 'd005'
;
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees 
--	  share each last name.
select employees.last_name, count(employees.last_name) as "Last name count"
from employees
group by employees.last_name 
order by "Last name count" DESC


