SELECT t.nome
FROM time t JOIN partida p ON t.nome = p.time1 OR t.nome = p.time2
WHERE p.local <> 'BELO HORIZONTE' AND p.local <> 'SAO CARLOS'
;
-- a consulta acima está incorreta pois, como a verificação do WHERE é "linha à linha",
-- não é possível realizar essa verificação através dele dessa forma


SELECT t.nome
FROM time t
WHERE NOT EXISTS (SELECT *
                  FROM partida
                  WHERE (t.nome = time1 OR t.nome = time2) AND
                        (local = 'BELO HORIZONTE' OR local = 'SAO CARLOS')
                 )
;