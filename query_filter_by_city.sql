/* find all records of customers that live in London */

SELECT *
FROM game_db1.customer
WHERE address NOT LIKE '%London Road%' 
	AND address LIKE '%London%'
    OR address LIKE '%Edinburgh%';
    