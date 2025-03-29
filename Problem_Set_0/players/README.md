# Problem to Solve
If you’re not familiar, baseball is a popular sport in which two teams of 9 players take turns batting (hitting a ball) and fielding (catching and throwing hit balls). Points (“runs”) are scored when a hitting team’s player hits a ball and eventually touches all bases before the fielding team’s players have the chance to get them “out.” Baseball is arguably most popular in the United States and Canada, where the [MLB (Major League Baseball)](https://en.wikipedia.org/wiki/Major_League_Baseball) has served as the professional association for players since 1876.

In a database called `players.db`, using a table called `players`, answer questions about MLB players who’ve played from 1871 to 2023.

# Schema

In `players.db` you’ll find a single table, `players`. In the `players` table, you’ll find the following columns:

- `id`, which uniquely identifies each row (player) in the table
- `first_name`, which is the first name of the player
- `last_name`, which is the last name of the player
- `bats`, which is the side (`R` for right or `L` for left) the player bats on
- `throws`, which is the hand (`R` for right or `L` for left) the player throws with
- `weight`, which is the player’s weight in pounds
- `height`, which is the player’s height in inches
- `debut`, which is the date (expressed as `YYYY-MM-DD`) the player began their career in the MLB
- `final_game`, which is the date (expressed as `YYYY-MM-DD`) the player played their last game in the MLB
- `birth_year`, which is the year the player was born
- `birth_month`, which is the month (expressed as an integer) the player was born
- `birth_day`, which is the day the player was born
- `birth_city`, which is the city in which the player was born
- `birth_state`, which is the state in which the player was born
- `birth_country`, which is the country in which the player was born

# Specification

1. In `1.sql`, write a SQL query to find the hometown (including city, state, and country) of Jackie Robinson.
2. In `2.sql`, write a SQL query to find the side (e.g., right or left) Babe Ruth hit.
3. In `3.sql`, write a SQL query to find the ids of rows for which a value in the column `debut` is missing.
4. In `4.sql`, write a SQL query to find the first and last names of players who were _not_ born in the United States. Sort the results alphabetically by first name, then by last name.
5. In `5.sql`, write a SQL query to return the first and last names of all right-handed batters. Sort the results alphabetically by first name, then by last name.
6. In `6.sql`, write a SQL query to return the first name, last name, and debut date of players born in Pittsburgh, Pennsylvania (PA). Sort the results first by debut date—from most recent to oldest—then alphabetically by first name, followed by last name.
7. In `7.sql`, write a SQL query to count the number of players who bat (or batted) right-handed and throw (or threw) left-handed, _or vice versa_.
8. In `8.sql`, write a SQL query to find the average height and weight, rounded to two decimal places, of baseball players who debuted on or after January 1st, 2000. Return the columns with the name “Average Height” and “Average Weight”, respectively.
9. In `9.sql`, write a SQL query to find the players who played their final game in the MLB in 2022. Sort the results alphabetically by first name, then by last name.
10. In `10.sql`, write SQL query to answer a question of your choice. This query should:
    - Make use of `AS` to rename a column
    - Involve at least condition, using `WHERE`
    - Sort by at least one column using `ORDER BY`
