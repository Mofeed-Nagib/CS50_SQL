CREATE TABLE IF NOT EXISTS passengers (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL CHECK(age > 0),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS airlines (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    concourse TEXT NOT NULL CHECK(concourse IN ("A", "B", "C", "D", "E", "F", "T")),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS flights (
    id INTEGER,
    airline_id INTEGER,
    number INTEGER NOT NULL CHECK(number > 0),
    departure_airport_code TEXT NOT NULL CHECK (departure_airport_code != arrival_airport_code),
    arrival_airport_code TEXT NOT NULL CHECK (departure_airport_code != arrival_airport_code),
    departure_timestamp NUMERIC NOT NULL CHECK(departure_timestamp < arrival_timestamp),
    arrival_timestamp NUMERIC NOT NULL CHECK(arrival_timestamp > departure_timestamp),
    PRIMARY KEY(id),
    FOREIGN KEY(airline_id) REFERENCES airlines(id)
);

CREATE TABLE IF NOT EXISTS checkins (
    id INTEGER,
    passenger_id INTEGER,
    flight_id INTEGER,
    datetime NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(passenger_id) REFERENCES passengers(id),
    FOREIGN KEY(flight_id) REFERENCES flights(id)
);
