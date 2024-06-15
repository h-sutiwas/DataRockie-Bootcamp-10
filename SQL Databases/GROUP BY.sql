-- GROUP BY

/*SELECT 
	country, 
	COUNT(*) AS count_country
FROM customers
GROUP BY Country;*/

SELECT 
	genres.name,
	COUNT(*) AS count_songs
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId
GROUP BY genres.name;