SELECT j.time1, t1.estado AS estado_time1, j.time2, t2.estado AS estado_time2
FROM joga j JOIN time t1 ON j.time1 = t1.nome
JOIN time t2 ON j.time2 = t2.nome
WHERE j.classico = 'S'
;
