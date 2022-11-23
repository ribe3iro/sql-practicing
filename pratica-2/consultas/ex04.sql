SELECT j.cpf, j.nome, j.data_nasc, t.nome AS time
FROM jogador j, time t
WHERE j.time = t.nome AND t.estado = 'SP'
;

SELECT j.cpf, j.nome, j.data_nasc, t.nome AS time
FROM jogador j JOIN time t ON j.time = t.nome
WHERE t.estado = 'SP'
;