SELECT city, SUM(type = "Public School") AS `Number of Public Schools`
FROM schools
GROUP BY city
ORDER BY `Number of Public Schools` DESC, city
LIMIT 10;