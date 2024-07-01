DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE season
(
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  height TEXT NOT NULL,
  current_team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  team_one_id INTEGER REFERENCES teams(id),
  team_two_id INTEGER REFERENCES teams(id),
  location TEXT NOT NULL,
  season_id INTEGER REFERENCES season(id),
  head_referee INTEGER REFERENCES referees(id),
  second_referee INTEGER REFERENCES referees(id)
);

CREATE TABLE lineups
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players(id),
  match_id INTEGER REFERENCES matches(id),
  team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  match_id INTEGER REFERENCES matches(id),
  team_one_result INTEGER NOT NULL,
  team_two_result INTEGER NOT NULL
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players(id),
  match_id INTEGER REFERENCES matches(id),
  goal_count INTEGER NOT NULL
);

INSERT INTO teams
(name, city, country)
VALUES 
  ('Goal Keepers', 'Los Angeles', 'US'),
  ('Soccer Stars', 'London', 'UK'),
  ('League Legends', 'Barcelona', 'ES'),
  ('Ball Busters', 'Seoul', 'KR');

INSERT INTO referees
(name)
VALUES
  ('Sean Grogo'),
  ('Tina Farrow'),
  ('Gregory Marks'),
  ('Bertha Star'),
  ('Walter Frank');

INSERT INTO season
(start_date, end_date)
VALUES
  ('2024-1-23', '2024-6-29'),
  ('2024-2-23', '2024-11-30'),
  ('2023-5-23', '2023-10-30'),
  ('2023-2-23', '2023-11-30');

INSERT INTO players
(name, height, current_team_id)
VALUES
  ('David Beckham', '6ft', 1),
  ('Mia Hamm', '5ft 3in', 2),
  ('Jennifer Rhodes', '5ft 11in', 3),
  ('Tiana Fields', '6ft 1in', 1),
  ('Peter Larson', '5ft 4in', 3),
  ('Sandra George', '4ft 11in', 4);

INSERT INTO matches
(team_one_id, team_two_id, location, season_id, head_referee, second_referee)
VALUES
  (1, 2, 'Los Angeles', 4, 2, 1),
  (2, 4, 'Seoul', 2, 3, 4),
  (3, 4, 'Barcelona', 1, 1, 2),
  (1, 3, 'New York', 3, 2, 3);

INSERT INTO lineups
(player_id, match_id, team_id)
VALUES
  (1, 3, 2),
  (2, 1, 4),
  (3, 3, 1),
  (4, 2, 3),
  (6, 4, 1),
  (5, 1, 4);

INSERT INTO results
(match_id, team_one_result, team_two_result)
VALUES
  (1, 3, 4),
  (2, 2, 3),
  (3, 0, 0),
  (4, 1, 1);

INSERT INTO goals
(player_id, match_id, goal_count)
VALUES
  (6, 1, 1),
  (4, 1, 1),
  (2, 2, 2),
  (3, 4, 0),
  (1, 3, 0),
  (5, 2, 3);
