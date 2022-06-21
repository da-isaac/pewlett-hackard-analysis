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