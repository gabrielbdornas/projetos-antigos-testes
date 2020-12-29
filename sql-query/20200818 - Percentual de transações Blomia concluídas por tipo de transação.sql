-- Percentual de transações Blomia concluídas por tipo de transação
SELECT rt.requisition_setting_id, 
rt.requisicoes_totais,
rc.requisicoes_concluidas,
rc.requisicoes_concluidas/rt.requisicoes_totais percentual
FROM
(
SELECT 
r.requisition_setting_id, 
CAST(COUNT(r.id) AS FLOAT) requisicoes_concluidas
FROM 
requisitions r
WHERE
r.status = 'concluido'
GROUP BY r.requisition_setting_id
)rc
JOIN
(
SELECT 
r.requisition_setting_id, 
CAST(COUNT(r.id) AS FLOAT) requisicoes_totais
FROM 
requisitions r
GROUP BY r.requisition_setting_id
)rt
ON rc.requisition_setting_id = rt.requisition_setting_id
-- COLOCAR O requisition_setting_id QUE DEVERÁ SER FILTRADO
-- WHERE rt.requisition_setting_id = 


