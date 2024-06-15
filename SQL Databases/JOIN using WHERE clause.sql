SELECT 
	a.ArtistId,
	a.name artistName,
	b.Title albumName
FROM artists a, albums b
WHERE a.ArtistId = b.AlbumId AND a.name LIKE 'c%';