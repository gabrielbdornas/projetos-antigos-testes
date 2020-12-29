SELECT
d.date,
w.withdraw_value,
de.deposit_value
FROM
(
SELECT DISTINCT DATE(created_at) as date,
company_id
FROM requisitions
)d
LEFT JOIN
(
SELECT DATE(created_at) as date,
company_id,
SUM(value) as withdraw_value
FROM requisitions
WHERE requisition_setting_id = 1
GROUP BY company_id, DATE(created_at)
)w
ON d.company_id = w.company_id
AND d.date = w.date
LEFT JOIN
(
SELECT DATE(created_at) as date,
company_id,
SUM(value) as deposit_value
FROM requisitions
WHERE requisition_setting_id = 2
GROUP BY company_id, DATE(created_at)
)de
ON d.company_id = de.company_id
AND d.date = de.date
WHERE d.company_id = 1
ORDER BY 1, 2 ASC

-- @requisitions_dates_values = Requisition.find_by_sql(sql)