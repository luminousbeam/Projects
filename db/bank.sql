DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  payee TEXT NOT NULL,
  tdate TEXT NOT NULL,
  amount MONEY NOT NULL,
  category TEXT NOT NULL,
  account_id INTEGER REFERENCES accounts(id)
);
