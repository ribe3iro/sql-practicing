SELECT j.classico, COUNT(p.data) AS nro_partidas
FROM partida p RIGHT JOIN joga j ON p.time1 = j.time1 AND p.time2 = j.time2
WHERE EXTRACT( MONTH FROM p.data ) IN (1, 2) AND j.classico IS NOT NULL
GROUP BY j.classico
;

SELECT j.classico, COUNT(CASE WHEN EXTRACT( MONTH FROM p.data ) IN (1, 2) THEN 1 END) AS nro_partidas
FROM partida p RIGHT JOIN joga j ON p.time1 = j.time1 AND p.time2 = j.time2
WHERE j.classico IS NOT NULL
GROUP BY j.classico
;
