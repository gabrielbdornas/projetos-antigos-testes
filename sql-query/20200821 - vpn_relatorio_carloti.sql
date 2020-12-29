SELECT
v.estacao_camg estacao,
v.nome,
vi.ip_renovado ip,
vi.host_name,
vi.patrimonio,
vi.mac,
v.observacao
FROM vpns v
LEFT JOIN vpn_importations vi
ON vi.estacao_camg = v.estacao_camg_renovada
WHERE vi.estacao_camg IS NOT NULL
AND CAST(v.estacao_camg_renovada AS INTEGER) % 2 = 0
 ORDER BY CAST(v.estacao_camg_renovada AS INTEGER) ASC


/*




UPDATE  vpns 
SET observacao = 'Estação com máquina instalada sem internet'
WHERE estacao_camg_renovada = '440';


UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '520';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '530';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '828';

UPDATE  vpns 
SET observacao = 'Máquina não está ligando'
WHERE estacao_camg_renovada = '800';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada IN ('828', '876', '886', '888', '900', '902', '904', '906','908', '910', '912', '912', '916', '918', '920', '922', '924', '1038');

UPDATE  vpns 
SET observacao = 'Máquina não está ligando'
WHERE estacao_camg_renovada = '1138';

UPDATE  vpns 
SET observacao = 'Máquina não está ligando'
WHERE estacao_camg_renovada = '914';
*/

