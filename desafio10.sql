SELECT
mu.nome AS nome,
COUNT(*) AS reproducoes
FROM SpotifyClone.usuarios AS us
INNER JOIN SpotifyClone.historico_reproducao AS hi
ON us.usuario_id = hi.usuario_id
INNER JOIN SpotifyClone.musicas AS mu
ON hi.musica_id = mu.musica_id
WHERE us.plano_id = 4 OR us.plano_id = 1
GROUP BY mu.nome
ORDER BY mu.nome
;