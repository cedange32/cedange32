CREATE TABLE `tasks` (
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `description` TEXT,
  `done` INTEGER
);

INSERT INTO tasks (description, done) VALUES ('Drink a beer', 0);