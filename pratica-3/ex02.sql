SELECT j.nome, j.data_nasc, j.time, p.data, p.local, joga.classico
FROM jogador j JOIN partida p ON j.time = p.time1 OR j.time = p.time2
               JOIN joga ON joga.time1 = p.time1 AND joga.time2 = p.time2
;
