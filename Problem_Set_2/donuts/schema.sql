CREATE TABLE IF NOT EXISTS ingredients (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    price_per_unit NUMERIC NOT NULL CHECK(price_per_unit > 0),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS donuts (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    gluten_free INTEGER NOT NULL CHECK(gluten_free IN (0, 1)),
    price NUMERIC NOT NULL CHECK(price > 0),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS customers (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS recipes (
    donut_id INTEGER,
    ingredient_id INTEGER,
    quantity NUMERIC NOT NULL CHECK(quantity > 0),
    PRIMARY KEY(donut_id, ingredient_id),
    FOREIGN KEY(donut_id) REFERENCES donuts(id),
    FOREIGN KEY(ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE IF NOT EXISTS orders (
    id INTEGER,
    order_number INTEGER NOT NULL UNIQUE CHECK(order_number > 0),
    customer_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

CREATE TABLE IF NOT EXISTS order_content (
    order_id INTEGER,
    donut_id INTEGER,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    PRIMARY KEY(order_id, donut_id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(donut_id) REFERENCES donuts(id)
);

CREATE TABLE IF NOT EXISTS order_history (
    customer_id INTEGER,
    order_id INTEGER,
    PRIMARY KEY(customer_id, order_id),
    FOREIGN KEY(customer_id) REFERENCES customers(id),
    FOREIGN KEY(order_id) REFERENCES orders(id)
);
