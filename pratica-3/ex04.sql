SELECT j.classico, COUNT(*) AS nro_partidas
FROM partida p JOIN joga j ON p.time1 = j.time1 AND p.time2 = j.time2
WHERE EXTRACT( MONTH FROM p.data ) IN (1, 2)
GROUP BY j.classico
;
