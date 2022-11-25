SELECT t.nome, t.estado, t.saldo_gols, EXTRACT( YEAR FROM p.data ) AS ano, COUNT(CASE WHEN j.classico = 'S' THEN 1 END) AS qntd_classicos
FROM joga j JOIN partida p ON j.time1 = p.time1 AND j.time2 = p.time2
            JOIN time t ON t.nome = j.time1 OR t.nome = j.time2
GROUP BY t.nome, t.estado, t.saldo_gols, EXTRACT( YEAR FROM p.data )
ORDER BY t.nome, ano
;
