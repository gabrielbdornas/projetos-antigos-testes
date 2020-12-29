SELECT municipios.nome estado, capitais.nome capital, municipios.count municipios
FROM
(
SELECT m.estado_id, m.nome
FROM municipios m
WHERE m.capital = true
) capitais
JOIN
(
SELECT e.id, e.nome, count(m.nome)
FROM estados e
JOIN municipios m ON e.id = m.estado_id
GROUP BY e.id, e.nome
ORDER BY 2
) municipios
ON capitais.estado_id = municipios.id