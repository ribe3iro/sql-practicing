SELECT COUNT(*) AS nro_classicos, EXTRACT( MONTH FROM p.data ) AS MES
FROM partida p JOIN joga j ON p.time1 = j.time1 AND p.time2 = j.time2
WHERE EXTRACT( YEAR FROM p.data ) = 2018 AND j.classico = 'S'
GROUP BY EXTRACT( MONTH FROM p.data )
ORDER BY nro_classicos DESC
;
