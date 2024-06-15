-- pattern matching
/* SELECT 
	FirstName, 
	LastName, 
	Country, 
	Email 
FROM customers
WHERE  email NOT LIKE '%@hotmail.com'; --wildcard % */

/* SELECT 
	FirstName, 
	LastName, 
	Country, 
	Email,
	Phone
FROM customers
WHERE  phone LIKE '%99%'; */

SELECT 
	FirstName, 
	LastName, 
	Country, 
	Email,
	Phone
FROM customers
WHERE FirstName LIKE 'Leon__'; -- % match multiple chars while _ match only single char