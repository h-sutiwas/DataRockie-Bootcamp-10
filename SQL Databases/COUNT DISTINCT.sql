-- COUNT DISTINCT
SELECT 
	COUNT(DISTINCT Country) distinct_country,
	COUNT(*) customer
FROM customers;