SELECT 
	a.ArtistId,
	a.Name artistName,
	b.Title albumName,
	c.name trackName,
	COUNT(*) Aerosmith_songs
FROM artists a 
INNER JOIN albums b ON a.ArtistId = b.AlbumId
INNER JOIN tracks c ON b.AlbumId = c.AlbumId
WHERE a.Name = 'Aerosmith' ;