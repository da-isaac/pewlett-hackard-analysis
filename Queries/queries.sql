-- Determine retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

-- Count workers who are eligible for retirement
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

-- Insert query into a new table (for export later)
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

-- Validate new table
SELECT * FROM retirement_info

-- create query that returns employee numbers, first name, last name,
-- and department name from the sale steam

SELECT e.emp_no, e.first_name, e.last_name, di.dept_name
FROM employees e
INNER JOIN dept_info di
ON di.emp_no = e.emp_no
WHERE di.dept_name = 'Sales' 
LIMIT 10;


--list of retirng employees in both sales and development deparments
--with same info as before, including the in statement

SELECT e.emp_no, e.first_name, e.last_name, di.dept_name
FROM retirement_info e
INNER JOIN dept_info di
ON di.emp_no = e.emp_no
WHERE di.dept_name IN ('Sales', 'Development')
LIMIT 10


-- Join department with dept_manager table
SELECT d.dept_name,
	m.emp_no,
	m.from_date,
	m.to_date
FROM departments AS d
INNER JOIN dept_manager AS m
ON m.dept_no = d.dept_no

-- Join retirement_info and dept_emp table
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info ri
LEFT JOIN dept_emp de
ON de.emp_no = ri.emp_no
WHERE de.to_date = '9999-01-01'

-- Employee count by department
SELECT COUNT (ce.emp_no), de.dept_no
FROM current_emp AS ce
LEFT JOIN dept_emp AS de
ON de.emp_no = ce.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- List 1: Employee Information
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info 
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
INNER JOIN dept_emp AS de
ON de.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND de.to_date = '9999-01-01'

-- List 2: Management
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
ON d.dept_no = dm.dept_no
INNER JOIN current_emp AS ce
ON ce.emp_no = dm.emp_no

-- List 3: Department Retirees
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp AS ce
INNER JOIN dept_emp AS de
ON de.emp_no = ce.emp_no
INNER JOIN departments AS d
ON d.dept_no = de.dept_no
