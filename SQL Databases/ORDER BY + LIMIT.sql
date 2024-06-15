-- ORDER BY + LIMIT

SELECT 
	genres.Name,
	COUNT(*)
FROM genres
JOIN tracks ON genres.GenreId = tracks.GenreId
GROUP BY genres.name
ORDER BY COUNT(*) DESC
LIMIT 5; -- descending order