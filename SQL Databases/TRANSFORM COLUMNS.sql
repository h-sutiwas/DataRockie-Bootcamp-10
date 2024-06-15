SELECT 
		name, 
		salary,
        salary * 1.15 AS new_salary,
        LOWER(name) || '@company.com' AS company_email
FROM employee;