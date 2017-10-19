-- +micrate Up
CREATE TABLE accounts (
  id BIGSERIAL PRIMARY KEY,
  username VARCHAR(255),
  encrypted_password VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- +micrate Down
DROP TABLE IF EXISTS accounts;
