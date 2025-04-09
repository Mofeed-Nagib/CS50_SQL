CREATE TABLE IF NOT EXISTS users (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS schools (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `type` ENUM("Elementary School", "Middle School", "High School", "Lower School", "Upper School", "College", "University", "Other") NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `year` YEAR NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS companies (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `industry` ENUM("Education", "Technology", "Finance", "Other") NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS user_connections (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED CHECK(user_id < connection_id),
    `connection_id` INT UNSIGNED,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(connection_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS user_school_connection (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree_type` ENUM("BA", "MA", "PhD", "Other") NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(school_id) REFERENCES schools(id)
);

CREATE TABLE IF NOT EXISTS user_company_connection (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `company_id` INT UNSIGNED,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title` VARCHAR(32) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(company_id) REFERENCES companies(id)
);
