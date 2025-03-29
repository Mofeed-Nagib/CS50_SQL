SELECT first_name AS `First Name`,
       last_name AS `Last Name`,
       height
FROM players
WHERE height >= 60
ORDER BY height DESC;
