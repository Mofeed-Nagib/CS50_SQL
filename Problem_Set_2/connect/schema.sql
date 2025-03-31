CREATE TABLE IF NOT EXISTS users (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS schools (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    type TEXT NOT NULL CHECK(type IN ("Elementary School", "Middle School", "High School", "Lower School", "Upper School", "College", "University", "Other")),
    location TEXT NOT NULL,
    year INTEGER NOT NULL CHECK(year > 0),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS companies (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    industry TEXT NOT NULL CHECK(industry IN ("Education", "Technology", "Finance", "Other")),
    location TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS user_connections (
    id INTEGER,
    user_id INTEGER CHECK(user_id != connection_id),
    connection_id INTEGER CHECK(connection_id != user_id),
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(connection_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS user_school_connection (
    id INTEGER,
    user_id INTEGER,
    school_id INTEGER,
    start_date NUMERIC NOT NULL,
    end_date NUMERIC,
    degree_type TEXT NOT NULL CHECK(degree_type IN ("BA", "MA", "PhD", "Other")),
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(school_id) REFERENCES schools(id)
);

CREATE TABLE IF NOT EXISTS user_company_connection (
    id INTEGER,
    user_id INTEGER,
    company_id INTEGER,
    start_date NUMERIC NOT NULL,
    end_date NUMERIC,
    title TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(company_id) REFERENCES companies(id)
);
