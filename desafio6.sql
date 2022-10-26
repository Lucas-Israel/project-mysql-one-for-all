SELECT 
IF (MIN(preco) = 0, "0.00", MIN(preco)) AS faturamento_minimo,
LCASE(ROUND(MAX(preco), 2)) AS faturamento_maximo,
LCASE(ROUND(AVG(preco), 2)) AS faturamento_medio,
LCASE(ROUND(SUM(preco), 2)) AS faturamento_total
FROM SpotifyClone.planos AS pl
INNER JOIN SpotifyClone.usuarios AS us
ON pl.plano_id = us.plano_id
;