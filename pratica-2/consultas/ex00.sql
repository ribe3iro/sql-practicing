SELECT p.data, p.placar, t1.nome, t1.estado, t2.nome, t2.estado
FROM partida p JOIN time t1 ON p.time1 = t1.nome
JOIN time t2 ON time2 = t2.nome
ORDER BY data
;

SELECT data, placar, time1, time2
FROM partida
ORDER BY data
;