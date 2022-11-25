SELECT j.classico, COUNT(p.data) AS nro_partidas
FROM partida p RIGHT JOIN joga j ON 
     p.time1 = j.time1 AND 
     p.time2 = j.time2 AND 
     EXTRACT( MONTH FROM p.data ) IN (1, 2)
WHERE j.classico IS NOT NULL
GROUP BY j.classico
;
