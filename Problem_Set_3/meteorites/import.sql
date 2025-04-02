CREATE TABLE IF NOT EXISTS temp (
    name TEXT,
    id INTEGER,
    nametype TEXT,
    class TEXT,
    mass NUMERIC,
    discovery TEXT,
    year INTEGER,
    lat NUMERIC,
    long NUMERIC
);

-- Import meteorites.csv into temporary table:
.import --csv meteorites.csv --skip 1 temp

UPDATE temp SET mass = NULL WHERE mass = "";
UPDATE temp SET year = NULL WHERE year = "";
UPDATE temp SET lat = NULL WHERE lat = "";
UPDATE temp SET long = NULL WHERE long = "";

UPDATE temp SET mass = ROUND(mass, 2);
UPDATE temp SET lat = ROUND(lat, 2);
UPDATE temp SET long = ROUND(long, 2);

DELETE FROM temp WHERE nametype = "Relict";

UPDATE temp SET year = 2010 WHERE year = 2101;

CREATE TABLE IF NOT EXISTS meteorites (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    class TEXT NOT NULL,
    mass NUMERIC CHECK(mass >= 0),
    discovery TEXT CHECK(discovery IN ("Fell", "Found")),
    year INTEGER CHECK(year > 0),
    lat NUMERIC,
    long NUMERIC,
    PRIMARY KEY(id)
);

INSERT INTO meteorites (name, class, mass, discovery, year, lat, long)
SELECT name, class, mass, discovery, year, lat, long
FROM temp
ORDER BY year, name;

DROP TABLE temp;