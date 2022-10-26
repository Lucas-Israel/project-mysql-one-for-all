SELECT
ar.nome AS artista,
al.album AS album,
COUNT(fo.artista_id) AS seguidores
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al
ON ar.artista_id = al.artista_id
INNER JOIN SpotifyClone.following AS fo
ON al.artista_id = fo.artista_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista, album
;