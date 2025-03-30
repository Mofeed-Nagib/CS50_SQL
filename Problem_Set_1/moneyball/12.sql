SELECT first_name, last_name
FROM players
WHERE (first_name, last_name) IN (SELECT first_name, last_name
                                  FROM players
                                  JOIN performances ON players.id = performances.player_id
                                  JOIN salaries ON players.id = salaries.player_id AND
                                                   performances.year = salaries.year
                                  WHERE salaries.year = 2001 AND H > 0
                                  ORDER BY salary / H, first_name, last_name
                                  LIMIT 10) AND
      (first_name, last_name) IN (SELECT first_name, last_name
                                  FROM players
                                  JOIN performances ON players.id = performances.player_id
                                  JOIN salaries ON players.id = salaries.player_id AND
                                                   performances.year = salaries.year
                                  WHERE salaries.year = 2001 AND RBI > 0
                                  ORDER BY salary / RBI, first_name, last_name
                                  LIMIT 10)
ORDER BY id;