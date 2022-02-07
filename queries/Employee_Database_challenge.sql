-- Retrieve the emp_no, first_name, and last_name columns from the Employees table
select emp_no, first_name, last_name
from Employees

-- Retrieve the title, from_date, and to_date columns from the Titles table.
select title, from_date, to_date
from Titles

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
