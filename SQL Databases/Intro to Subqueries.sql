-- SELECT * FROM tracks ORDER BY Milliseconds DESC LIMIT 1;

SELECT FirstName, LastName, Country FROM
	(SELECT * 
	FROM customers
	WHERE Country = 'USA');
