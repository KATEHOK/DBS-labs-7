-- Устанавливаем уровень транзакции для первой сессии
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Начинаем первую транзакцию в первой сессии, вносим изменения
BEGIN;
UPDATE series.shows SET title = 'I Want to Sleep' WHERE id = 1;
INSERT INTO series.shows (title) VALUES ('First session, First transaction');
SELECT * FROM series.shows;

-- Состояние в первой сессии в первой транзакции после изменений во второй сессии
SELECT * FROM series.shows;

-- Откатываем изменения первой транзакции первой сессии
ROLLBACK;
SELECT * FROM series.shows;

-- Состояние в первой сессии после первого коммита во второй сессии
SELECT * FROM series.shows;

-- Вторая транзакция первой сессии
BEGIN;
UPDATE series.shows SET title = 'I Want to Sleep' WHERE id = 3;
INSERT INTO series.shows (title) VALUES ('First session, Second transaction');
SELECT * FROM series.shows;

-- Состояние в первой сессии во второй транзакции после изменений во второй сессии
SELECT * FROM series.shows;

-- Коммит второй транзакции первой сессии
COMMIT;
SELECT * FROM series.shows;

-- Состояние в первой сессии после второго коммита во второй сессии
SELECT * FROM series.shows;