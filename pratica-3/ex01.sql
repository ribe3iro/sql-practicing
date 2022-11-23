SELECT t.nome, t.estado
FROM time t JOIN uniforme u ON t.nome = u.time
WHERE u.tipo = 'TITULAR' AND u.cor_principal IS NULL
;
