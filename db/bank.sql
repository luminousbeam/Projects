DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id serial PRIMARY KEY,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL
);

CREATE TABLE accounts (
  id serial PRIMARY KEY,
  payee varchar(100) NOT NULL,
  amount integer NOT NULL,
  enter_time timestamp,
  category text not null,
  user_id integer REFERENCES users(id)
);
