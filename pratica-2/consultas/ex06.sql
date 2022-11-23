SELECT p.time1, p.time2, p.data, p.placar, j.classico
FROM partida p JOIN joga J ON p.time1 = j.time1 AND p.time2 = j.time2
WHERE p.local = 'SANTOS'
;
