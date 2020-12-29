-- Primeira conferência: quantas empresas existem cadastradas na tabela companies
SELECT count(*) FROM companies c 

-- Segunda Conferência: quantas empresas com as senhas iguais na junção das tabelas compaines e user
SELECT count(*) FROM (
SELECT u.id user_id, 
c.id company_id, 
u.encrypted_password, 
c.requisition_password,
CASE WHEN u.encrypted_password = c.requisition_password THEN 'IGUAIS' ELSE 'DIFERENTES' END sao_iguais
FROM companies c
JOIN users u 
ON u.id = c.user_id
WHERE CASE WHEN u.encrypted_password = c.requisition_password THEN 'IGUAIS' ELSE 'DIFERENTE' END = 'IGUAIS'
)a

-- Terceira Conferência: campo com senhas iguais na junção das tabelas compaines e user
SELECT u.id user_id, 
c.id company_id, 
u.encrypted_password, 
c.requisition_password,
CASE WHEN u.encrypted_password = c.requisition_password THEN 'IGUAIS' ELSE 'DIFERENTES' END sao_iguais
FROM companies c
JOIN users u 
ON u.id = c.user_id

-- Quarta Conferência: campo com senhas diferentes na junção das tabelas compaines e user
SELECT u.id user_id, 
c.id company_id, 
u.encrypted_password, 
c.requisition_password,
CASE WHEN u.encrypted_password = c.requisition_password THEN 'IGUAIS' ELSE 'DIFERENTES' END sao_iguais
FROM companies c
JOIN users u 
ON u.id = c.user_id
WHERE CASE WHEN u.encrypted_password = c.requisition_password THEN 'IGUAIS' ELSE 'DIFERENTE' END = 'DIFERENTES'

-- Quinta Conferência: tabela compaines com campo requisition_password nulo
SELECT * FROM companies c 
WHERE c.requisition_password IS NULL

-- Quinta Conferência: tabela compaines com campo requisition_password vazio
SELECT * FROM companies c 
WHERE c.requisition_password = ''

