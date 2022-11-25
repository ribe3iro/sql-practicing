SELECT t1.nome, COUNT(*) AS nro_sem_gols
FROM time t1 JOIN partida p ON t1.nome = p.time1
WHERE t1.nome IN (SELECT DISTINCT t_.nome
                 FROM partida p_ JOIN joga j_ ON p_.time1 = j_.time1 AND p_.time2 = j_.time2
                                 JOIN time t_ ON t_.nome = p_.time1 OR t_.nome = p_.time2
                 WHERE t_.tipo = 'PROFISSIONAL' AND j_.classico = 'S')
AND REGEXP_LIKE(p.placar, '[0]{1,2}\X[[:digit:]]{1,2}')
GROUP BY t1.nome
HAVING COUNT(*) >= 2
;
