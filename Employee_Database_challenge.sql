
-- Create a table using the INTO clause
select e.emp_no, e.first_name, 
	e.last_name, ti.title, ti.from_date, ti.to_date
into retirement_titles
from employees as e
join Titles as ti
on (e.emp_no = ti.emp_no)
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, title DESC;

-- retrieve the number of employees by their most recent job title who are about to retire
select count(emp_no), title
into retiring_titles
from unique_titles
GROUP BY title 
ORDER BY COUNT(title) DESC;

-- DELIVERABLE 2
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibilty
FROM employees as e
Join dept_emp as de
ON (e.emp_no = de.emp_no)
Join titles as ti
ON (e.emp_no = ti.emp_no)
WHERE  (de.to_date = '9999-01-01') and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;