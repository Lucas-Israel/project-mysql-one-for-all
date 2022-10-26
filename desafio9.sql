SELECT
COUNT(*) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_reproducao AS hi
INNER JOIN SpotifyClone.usuarios AS us
ON hi.usuario_id = us.usuario_id
WHERE us.usuario_id = 1
;