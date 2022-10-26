SELECT
mu.nome AS cancao,
COUNT(mu.nome) AS reproducoes
FROM SpotifyClone.historico_reproducao AS hi
INNER JOIN SpotifyClone.musicas AS mu
ON hi.musica_id = mu.musica_id
GROUP BY mu.nome
ORDER BY reproducoes DESC, cancao
LIMIT 2
;