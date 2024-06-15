SELECT
	art.ArtistId,
	art.name,
	alb.title,
	tra.name,
	tra.composer
FROM artists AS art
JOIN albums AS alb
ON art.ArtistId = alb.ArtistId
JOIN tracks AS tra
ON tra.AlbumId = alb.AlbumId

WHERE art.name = "Aerosmith";