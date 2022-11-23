SELECT * 
FROM jogador, time
;

SELECT *
FROM jogador JOIN time on jogador.time = time.nome
;

SELECT j.cpf, j.nome, FLOOR((SYSDATE - j.data_nasc)/365) AS idade, t.nome AS time, t.estado AS estado_time
FROM jogador j JOIN time t ON j.time = t.nome
;