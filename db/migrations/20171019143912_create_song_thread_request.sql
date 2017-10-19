-- +micrate Up
CREATE TABLE song_thread_requests (
  id BIGSERIAL PRIMARY KEY,
  account_id INTEGER REFERENCES accounts (id),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- +micrate Down
DROP TABLE IF EXISTS song_thread_requests;
