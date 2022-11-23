SELECT t.nome, t.estado, d.nome AS diretor
FROM time t LEFT JOIN diretor d ON t.nome = d.time
ORDER BY t.nome, t.estado
;

SELECT t.nome, t.estado, (SELECT LISTAGG(d.nome, ';')
                          FROM diretor d
                          WHERE d.time = t.nome) AS diretores
FROM time t
;
