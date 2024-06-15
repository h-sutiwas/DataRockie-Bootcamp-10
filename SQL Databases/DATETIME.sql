SELECT 
	InvoiceDate,
	CAST(STRFTIME('%Y', InvoiceDate) AS INT) AS year,
	STRFTIME('%m', InvoiceDate) AS month,
	STRFTIME('%d', InvoiceDate) AS day,
	STRFTIME('%Y-%m', InvoiceDate) AS monthid
FROM invoices
WHERE year = 2010;