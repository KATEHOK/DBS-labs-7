BEGIN;

-- Добавление данных в таблицу actors
DO $$ 
BEGIN 
    FOR i IN 1..1000 LOOP
        INSERT INTO people.actors (name, birth, bio)
        VALUES (
            'Actor ' || i, 
            (CURRENT_DATE - (random() * 365 * 100) * interval '1 day'), 
            'Bio for ' || i
        );
    END LOOP; 
END $$;

-- Добавление данных в таблицу shows
DO $$ 
BEGIN 
    FOR i IN 1..1000 LOOP
        INSERT INTO series.shows (title, year, budget, synopsis)
        VALUES (
            'Show ' || i, 
            FLOOR(1980 + random() * (2025 - 1980 + 1)), 
            FLOOR(1000000 + random() * 9000000), 
            'Synopsis for ' || i
        );
    END LOOP; 
END $$;

-- Добавление данных в таблицу cast
DO $$ 
BEGIN 
    FOR i IN 1..100 LOOP
        -- Генерация случайных значений для actor_id и show_id
        INSERT INTO relationships.cast (actor_id, show_id, role)
        SELECT 
            a.id, 
            s.id, 
            'Role for ' || i
        FROM 
            people.actors a
            JOIN series.shows s ON true
        WHERE NOT EXISTS (
            SELECT 1 
            FROM relationships.cast c 
            WHERE c.actor_id = a.id AND c.show_id = s.id
        )
        ORDER BY random() 
        LIMIT 1;
    END LOOP; 
END $$;

-- Добавление данных в таблицу seasons
DO $$ 
BEGIN 
    FOR i IN 1..1000 LOOP
        INSERT INTO series.seasons (show_id, title, season, date)
        SELECT 
            s.id, 
            'Season ' || i, 
            FLOOR(1 + random() * 10), 
            (CURRENT_DATE - (random() * 365 * 5) * interval '1 day')
        FROM 
            series.shows s
        ORDER BY random() 
        LIMIT 1;
    END LOOP; 
END $$;

-- Добавление данных в таблицу episodes
DO $$ 
BEGIN 
    FOR i IN 1..1000 LOOP
        INSERT INTO series.episodes (season_id, title, episode, date)
        SELECT 
            se.id, 
            'Episode ' || i, 
            FLOOR(1 + random() * 10), 
            (CURRENT_DATE - (random() * 365 * 5) * interval '1 day')
        FROM 
            series.seasons se
        ORDER BY random() 
        LIMIT 1;
    END LOOP; 
END $$;

-- Добавление данных в таблицу reviews
DO $$ 
BEGIN 
    FOR i IN 1..1000 LOOP
        INSERT INTO series.reviews (show_id, reviewer, text, rating)
        SELECT 
            s.id, 
            'Reviewer ' || i, 
            'Review ' || i, 
            FLOOR(1 + random() * 10)
        FROM 
            series.shows s
        ORDER BY random() 
        LIMIT 1;
    END LOOP; 
END $$;

COMMIT;