-- Устанавливаем уровень транзакции для второй сессии
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Начало первой транзакции второй сессии
BEGIN;

-- Состояние сразу после начала первой транзакции второй сессии
SELECT * FROM series.shows;

-- Состояние во второй сессии в первой транзакции после изменений в первой сессии
SELECT * FROM series.shows;

-- Модифицируем данные во второй сессии в первой транзакции
UPDATE series.shows SET title = 'Updated: Second session, First transaction' WHERE id = 2;
INSERT INTO series.shows (title) VALUES ('Inserted: Second session, First transaction');
SELECT * FROM series.shows;

-- Состояние во второй сессии в первой транзакции после роллбэка из первой сессии
SELECT * FROM series.shows;

-- Состояние во второй сессии после первой транзакции
COMMIT;
SELECT * FROM series.shows;

-- Начало второй транзакции второй сессии
BEGIN;

-- Состояние сразу после начала второй транзакции второй сессии
SELECT * FROM series.shows;

-- Состояние во второй сессии во второй транзакции после изменений в первой сессии
SELECT * FROM series.shows;

-- Модифицируем данные во второй транзакции второй сессии
UPDATE series.shows SET title = 'Updated: Second session, Second transaction' WHERE id = 4;
INSERT INTO series.shows (title) VALUES ('Inserted: Second session, Second transaction');
SELECT * FROM series.shows;

-- Состояние во второй сессии во второй транзакции после коммита из первой сессии
SELECT * FROM series.shows;

-- Состояние из второй сессии после второй транзакции
COMMIT;
SELECT * FROM series.shows;
