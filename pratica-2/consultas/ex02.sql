SELECT to_char(data, 'DD/MM/YYYY HH24:MI:SS') AS data, local
FROM partida
WHERE time1 = 'PALMEIRAS' OR time2 = 'PALMEIRAS'
;