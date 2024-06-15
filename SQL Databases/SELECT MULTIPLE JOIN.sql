SELECT
	*
FROM artists
JOIN albums 
ON artists.ArtistId = albums.ArtistId
/* JOIN TABLE artists and albums on 
primary_keys of artists = foreign_keys of albums 
keys of ER Diagram connect multiple tables together*/
WHERE artists.ArtistId = 50;