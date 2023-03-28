CREATE SCHEMA games;

CREATE TABLE games.game_sales(
    id serial PRIMARY KEY,
    customer integer NOT NULL,
    game_name VARCHAR (50) NOT NULL,
    store VARCHAR(20),
    price integer,
    receipt jsonb,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);