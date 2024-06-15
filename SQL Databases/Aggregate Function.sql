-- Aggregate Functions
SELECT 
	ROUND(AVG(Milliseconds), 2) avg_mill,
	SUM(Milliseconds) sum_mill,
	MIN(Milliseconds) min_mill,
	MAX(Milliseconds) max_mill,
	COUNT(Milliseconds) count_mill
FROM tracks; -- Aggregate Functions skip Null value