SELECT * FROM hospital_groups;

SELECT COUNT(*) FROM hospital_groups; -- 5

SELECT * FROM hospitals;

SELECT COUNT(*) FROM hospitals; -- 20

-- Conferência Join hospitais com hospital_groups
SELECT hg.name complexo, COUNT(h.id) hospitais
FROM hospitals h
JOIN hospital_groups hg
ON h.hospital_group_id = hg.id
GROUP BY 1
ORDER BY 2 DESC
-- Conferência Join hospitais com hospital_groups