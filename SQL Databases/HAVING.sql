-- filter groups

SELECT 
	genres.name,
	COUNT(*) AS count_songs
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId AND genres.name <> 'Rock'
GROUP BY genres.name
HAVING COUNT(*) >= 100;

-- WHERE filter table but HAVING filter group