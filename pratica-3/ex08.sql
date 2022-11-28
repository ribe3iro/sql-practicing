SELECT estado, tipo, COUNT(nome), AVG(saldo_gols)
FROM time
GROUP BY tipo, estado
ORDER BY estado, tipo
;
