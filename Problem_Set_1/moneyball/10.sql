SELECT first_name, last_name, salary, HR, performances.year
FROM players
JOIN performances ON players.id = performances.player_id
JOIN salaries ON players.id = salaries.player_id AND
                 performances.year = salaries.year
ORDER BY players.id, performances.year DESC, HR DESC, salary DESC;
