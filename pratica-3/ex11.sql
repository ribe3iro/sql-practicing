SELECT nome, estado, saldo_gols
FROM time t
WHERE saldo_gols = (
    SELECT MIN(saldo_gols)
    FROM time
    WHERE estado = t.estado
)
GROUP BY estado, nome, saldo_gols
ORDER BY saldo_gols, estado
;
