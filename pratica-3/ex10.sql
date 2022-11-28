SELECT t.nome
FROM time t
WHERE estado = 'SP' AND nome != 'SANTOS'
AND
NOT EXISTS (
    (SELECT local 
    FROM partida 
    WHERE (time1 = 'SANTOS' OR time2 = 'SANTOS') AND local IS NOT NULL)
    MINUS
    (SELECT local 
    FROM partida 
    WHERE time1 = t.nome OR time2 = t.nome)
)
;
