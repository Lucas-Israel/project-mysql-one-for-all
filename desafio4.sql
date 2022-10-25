select
us.nome as usuario,
if(max(year(hi.data_reproducao)) > 2020,'Usuário ativo','Usuário inativo') as status_usuario
from SpotifyClone.usuarios as us
inner join SpotifyClone.historico_reproducao as hi
on us.usuario_id = hi.usuario_id
group by usuario
order by usuario
;