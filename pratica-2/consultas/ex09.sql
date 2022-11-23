SELECT p.time1, t1.estado AS estado_time1, p.time2, t2.estado AS estado_time2
FROM partida p JOIN time t1 ON p.time1 = t1.nome
               JOIN time t2 ON p.time2 = t2.nome
WHERE t1.estado = 'SP' OR t2.estado = 'SP'
;
