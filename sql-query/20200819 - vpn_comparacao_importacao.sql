SELECT 
v.nome,
v.estacao_camg estacao_inicial, 
CAST(v.estacao_camg_renovada AS INTEGER) estacao_inicial_renovada,
vi.estacao_camg estacao_importacao, 
vi.ip_renovado ip, 
vi.host_name,
vi.patrimonio,
vi.mac 
FROM vpns v 
LEFT JOIN vpn_importations vi 
ON vi.estacao_camg = v.estacao_camg_renovada 
WHERE vi.estacao_camg IS NULL 
AND CAST(v.estacao_camg_renovada AS INTEGER) % 2 = 0
ORDER BY 3 ASC 

