-- NULL / missing values
SELECT 
	company,
	COALESCE(Company, 'End Customer') AS 'Company Clean',
	CASE WHEN company IS NULL THEN 'End Customer'
		ELSE 'Corporate'
	END AS 'Company Clean 2'
FROM customers;