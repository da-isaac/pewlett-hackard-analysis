-- DELIVERABLE 1

-- Setup the retirement-title table
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO
	retirement_titles
FROM
	employees e
INNER JOIN titles t
	ON t.emp_no = e.emp_no
WHERE
	e.birth_date >= '1952-01-01'
	AND e.birth_date < '1956-01-01'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT 
    DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title
INTO unique_retirement_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--Table for number of employees by most recent job title and who are about to retire
SELECT
	COUNT(title) "count",
	title
INTO
	retiring_titles
FROM
	unique_retirement_titles
GROUP BY title
ORDER BY "count" DESC


-- DELIVERABLE 2

-- Create Mentorship Eligibility table
SELECT
	DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO 
	mentorship_eligibility
FROM
	employees e
INNER JOIN
	dept_emp de
	ON de.emp_no = e.emp_no
INNER JOIN
	titles t
	ON t.emp_no = e.emp_no
WHERE
	t.to_date = '9999-01-01' --adding this to ensure we get the current employee title
	AND de.to_date = '9999-01-01'
	AND e.birth_date >= '1965-01-01'
	AND e.birth_date < '1966-01-01'
ORDER BY e.emp_no