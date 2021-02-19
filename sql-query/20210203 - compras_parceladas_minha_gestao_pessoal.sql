SELECT 
ap.period,
pc.account_posting_id,
pc.account,
pc.date,
pc.description,
RIGHT(pc.description, (length(pc.description)-position('-' IN pc.description)-1)) short_description,
pc.value,
pc.value,
pc.store,
pc."owner",
pc.credit_card_last_numbers,
max(pc.id)
FROM postings_configurations pc 
JOIN account_postings ap 
ON ap.id = pc.account_posting_id 
WHERE LOWER(LEFT(pc.description , 9)) = 'parcelado'
GROUP BY 7-- 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
-- ORDER BY pc.created_at DESC 


SELECT max(t.id), 
t.short_description 
FROM 
(
SELECT pc.id,
RIGHT(pc.description, (length(pc.description)-position('-' IN pc.description)-1)) short_description,
pc.sub_category_id,
pc.account,
pc.store,
pc.owner
FROM postings_configurations pc 
JOIN account_postings ap 
ON ap.id = pc.account_posting_id 
WHERE LOWER(LEFT(pc.description , 9)) = 'parcelado'
)t
GROUP BY 2

SELECT max(pc.id) id,
RIGHT(pc.description, (length(pc.description)-position('-' IN pc.description)-1)) short_description,
pc.sub_category_id,
pc.account,
pc.store,
pc.owner
FROM postings_configurations pc 
JOIN account_postings ap 
ON ap.id = pc.account_posting_id 
WHERE LOWER(LEFT(pc.description , 9)) = 'parcelado'
GROUP BY 2, 3, 4, 5, 6


-- PAREI PENSANDO QUE SERIA MELHOR BUSCAR O VALOR MÁXIMO DA PARCELA_PAGA E NÃO DO ID

-- BUSCAR DEMAIS INFORMAÇÕES DE POSTING_CONFIGURATION PARA LIGAÇÕES EXISTENTES COM ACCOUNT_POSTINGS
SELECT pc.id,
ap."period",
pc.description,
t.short_description,
substring(pc.description, (position(' ' IN pc.description)+1), ((position('-' IN pc.description)-1)-(position(' ' IN pc.description)+1))) pago_parcela,
substring(pc.description, (position(' ' IN pc.description)+1), ((position('/' IN pc.description))-(position(' ' IN pc.description)+1))) parcela_paga,
substring(pc.description, (position('/' IN pc.description)+1), ((position('/' IN pc.description))-(position(' ' IN pc.description)))) parcelas
FROM postings_configurations pc 
JOIN 
(
-- BUSCAR O VALOR MÁXIMO DE ID DE POSTING_CONFIGURATION, GARANTINDO QUE O ULTIMO PERÍDO VEIO
SELECT max(pc.id) id,
RIGHT(pc.description, (length(pc.description)-position('-' IN pc.description)-1)) short_description,
pc.sub_category_id,
pc.account,
pc.store,
pc.owner
FROM postings_configurations pc 
JOIN account_postings ap 
ON ap.id = pc.account_posting_id 
WHERE LOWER(LEFT(pc.description , 9)) = 'parcelado'
GROUP BY 2, 3, 4, 5, 6
-- BUSCAR O VALOR MÁXIMO DE ID DE POSTING_CONFIGURATION, GARANTINDO QUE O ULTIMO PERÍDO VEIO
)t
ON t.id = pc.id
JOIN account_postings ap
ON pc.account_posting_id = ap.id
-- BUSCAR DEMAIS INFORMAÇÕES DE POSTING_CONFIGURATION PARA LIGAÇÕES EXISTENTES COM ACCOUNT_POSTINGS
