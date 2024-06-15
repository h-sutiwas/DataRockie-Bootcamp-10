-- join table with WHERE clause
SELECT
	artists.ArtistId,
	artists.name AS artist_name,
	albums.Title AS album_name,
	tracks.name AS song_name
FROM artists, albums, tracks
WHERE artists.ArtistId = albums.ArtistId -- PK = FK
	AND albums.AlbumId = tracks.AlbumId
	AND artists.ArtistId IN (8, 100, 120);
