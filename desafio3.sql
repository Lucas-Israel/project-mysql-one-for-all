SELECT 
us.nome as usuario,
count(hi.musica_id) as qt_de_musicas_ouvidas,
round(sum(mu.duracao_seconds) / 60, 2) as total_minutos
FROM SpotifyClone.usuarios as us
INNER JOIN SpotifyClone.historico_reproducao as hi
ON us.usuario_id = hi.usuario_id
INNER JOIN SpotifyClone.musicas as mu
ON hi.musica_id = mu.musica_id
group by usuario
order by usuario
;