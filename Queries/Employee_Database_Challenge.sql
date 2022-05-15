-- Deliverable 1: The Number of Retiring Employees by Title
Select  e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
From employees as e
Inner Join titles as t
ON (e.emp_no = t.emp_no)
Where (e.birth_date Between '1952-01-01' AND '1955-12-31')
Order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
Where to_date = '9999-01-01'
ORDER BY emp_no, title DESC;

-- Retrieve the # of employees by their most recent job title who are about to retire
Select Count(ut.emp_no), ut.title
INTO retiring_titles
From unique_titles as ut
Group by title
Order by Count(title) DESC;


-- Deliverable 2 The Employees Eligible for the Mentorship Program
-- create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

Select Distinct ON (e.emp_no) 
					e.emp_no,
					e.first_name,
					e.last_name,
					de.from_date,
					de.to_date,
					t.title
INTO mentorship_eligibility
FROM employees as e
Left Outer Join dept_emp as de
	ON (e.emp_no = de.emp_no)
Left Outer Join titles as t
	ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date Between '1965-01-01' AND '1965-12-31')
Order by e.emp_no;

