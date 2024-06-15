SELECT 
	Name,
	ROUND(Milliseconds/60000.00, 2) AS minute,
	ROUND(Bytes/(1024*1024.0), 2) AS mb
FROM tracks;