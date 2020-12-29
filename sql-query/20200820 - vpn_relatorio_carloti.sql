SELECT
v.estacao_camg,
v.estacao_camg_renovada estacao_importacao_v,
vi.estacao_camg estacao_importacao,
v.nome,


vi.ip_renovado ip,
vi.host_name,
vi.patrimonio,
vi.mac
FROM vpns v
LEFT JOIN vpn_importations vi
ON vi.estacao_camg = v.estacao_camg_renovada
WHERE vi.estacao_camg IS NOT NULL
AND CAST(v.estacao_camg_renovada AS INTEGER) % 2 = 0
--AND v.observacao IS null
ORDER BY CAST(v.estacao_camg_renovada AS INTEGER) ASC

SELECT * FROM vpns vi 


/*

UPDATE  vpns 
SET estacao_camg = '408', estacao_camg_renovada = '408'
WHERE estacao_camg = '508';


UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '408';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '422';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '424';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '430';

UPDATE  vpns 
SET observacao = 'Fora do domínio'
WHERE estacao_camg_renovada = '672';

UPDATE  vpns 
SET observacao = 'Fora do domínio'
WHERE estacao_camg_renovada = '552';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '542';

UPDATE  vpns 
SET observacao = 'Fora do domínio'
WHERE estacao_camg_renovada = '776';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '860';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '862';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '864';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '866';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '868';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '870';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '872';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '874';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '878';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '1026';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '1038';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '1160';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '1164';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '1170';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '1182';

UPDATE  vpns 
SET observacao = 'Estação sem máquina instalada'
WHERE estacao_camg_renovada = '1096';

*/


        