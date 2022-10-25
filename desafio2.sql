SELECT COUNT(mu.nome) as cancoes, COUNT(DISTINCT(ar.nome)) as artistas, COUNT(DISTINCT(al.album)) as albuns
FROM SpotifyClone.albuns as al
INNER JOIN SpotifyClone.artistas as ar
ON al.artista_id = ar.artista_id
INNER JOIN SpotifyClone.musicas as mu
ON mu.album_id = al.album_id
;