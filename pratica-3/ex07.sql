SELECT t.nome, COUNT(*) AS partidas_sem_gols
FROM time t JOIN partida p ON t.nome = p.time1 OR t.nome = p.time2
WHERE t.nome IN (SELECT DISTINCT t_.nome
                 FROM partida p_ JOIN joga j_ ON p_.time1 = j_.time1 AND p_.time2 = j_.time2
                                 JOIN time t_ ON t_.nome = p_.time1 OR t_.nome = p_.time2
                 WHERE t_.tipo = 'PROFISSIONAL' AND j_.classico = 'S')
AND (
    (t.nome = p.time1 AND REGEXP_LIKE(p.placar, '^(0|00)\X[[:digit:]]{1,2}')) OR
    (t.nome = p.time2 AND REGEXP_LIKE(p.placar, '[[:digit:]]{1,2}\X(0|00)$'))
    )
GROUP BY t.nome
HAVING COUNT(*) >= 2
;
