-- https://stackoverflow.com/questions/15817871/postgresql-filter-a-date-range
select * from requisitions
where created_at > '2020-06-19 00:00:00'::timestamp
order by created_at desc