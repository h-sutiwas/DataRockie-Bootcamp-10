DELETE FROM employee
WHERE id = 5;

/* WHERE name = 'Walker' but be sure to have only one Walker in the table*/

DELETE FROM employee
WHERE id IN (2, 4);

SELECT * FROM employee;