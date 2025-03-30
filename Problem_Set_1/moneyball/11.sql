SELECT first_name, last_name, salary / H AS `dollars per hit`
FROM players
JOIN performances ON players.id = performances.player_id
JOIN salaries ON players.id = salaries.player_id AND
                 performances.year = salaries.year
WHERE salaries.year = 2001 AND H > 0
ORDER BY `dollars per hit`, first_name, last_name
LIMIT 10;