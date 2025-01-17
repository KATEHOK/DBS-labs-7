-- Удалить все добавленные
DELETE FROM series.shows
wHERE id > 5;
-- Восстановить измененные
UPDATE series.shows SET title = 'Game of Thrones' WHERE id = 1;
UPDATE series.shows SET title = 'Breaking Bad' WHERE id = 2;
UPDATE series.shows SET title = 'Stranger Things' WHERE id = 3;
UPDATE series.shows SET title = 'Friends' WHERE id = 4;
UPDATE series.shows SET title = 'The Mandalorian' WHERE id = 5;
-- Результат
SELECT * FROM series.shows;