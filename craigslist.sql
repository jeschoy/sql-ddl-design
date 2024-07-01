DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  preferred_region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  location TEXT NOT NULL,
  user_id INTEGER REFERENCES users(id),
  region_id INTEGER REFERENCES regions(id),
  category_id INTEGER REFERENCES categories(id)
);

INSERT INTO regions
  (name)
VALUES
  ('Los Angeles, CA'),
  ('San Francisco, CA'),
  ('San Diego, CA');

INSERT INTO categories
  (name)
VALUES
  ('technology'),
  ('housing'),
  ('furniture');

INSERT INTO users
  (username, preferred_region_id)
VALUES
  ('KayaTheDog', 3),
  ('FriendlyIPromist', 1),
  ('GhostytheCat', 2);

INSERT INTO posts
  (title, description, location, user_id, region_id, category_id)
VALUES
  ('Gaming laptop for sale', '2023 Macbook Pro M1 for sale to play games with', 'San Francisco, CA', 1, 2, 1),
  ('Apartment for rent', '1 br 1 ba apartment for rent for cheap!', 'San Diego, CA', 2, 3, 2),
  ('Free couch', 'Free couch for taking, must pick up today', 'Santa Monica, CA', 3, 1, 3);