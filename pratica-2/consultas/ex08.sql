SELECT u.time, u.cor_principal
FROM uniforme u JOIN time t ON u.time = t.nome
WHERE u.tipo = 'TITULAR' AND t.estado = 'MG'
;
