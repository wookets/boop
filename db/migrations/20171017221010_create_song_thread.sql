-- +micrate Up
CREATE TABLE song_threads (
  id BIGSERIAL PRIMARY KEY,
  primary_account_id INTEGER REFERENCES accounts (id),
  secondary_account_id INTEGER REFERENCES accounts(id),
  title VARCHAR(255),
  bpm INTEGER,
  actions_per_turn INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- +micrate Down
DROP TABLE IF EXISTS song_threads;
