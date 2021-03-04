SELECT sum(ap.value) FROM account_postings ap 
WHERE ap.description NOT LIKE 'PGTO DEBITO CONTA%'
AND ap.description NOT LIKE '%HEROKU%'

SELECT * FROM account_postings ap 
ORDER BY value desc
WHERE ap.description LIKE 'PGTO DEBITO CONTA%'