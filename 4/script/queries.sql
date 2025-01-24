-- shows
EXPLAIN SELECT * FROM series.shows WHERE title = 'Game of Thrones';
EXPLAIN SELECT * FROM series.shows WHERE year = 2020;
EXPLAIN SELECT * FROM series.shows WHERE budget > 100000000;

-- actors
EXPLAIN SELECT * FROM people.actors WHERE name = 'Emilia Clarke';

-- cast+actors
EXPLAIN SELECT s.* 
FROM series.shows s
JOIN relationships.cast c ON s.id = c.show_id
WHERE c.actor_id = (SELECT id FROM people.actors WHERE name = 'Emilia Clarke');

-- reviews 
EXPLAIN SELECT * FROM series.reviews WHERE show_id = 1;
EXPLAIN SELECT * FROM series.reviews WHERE rating >= 8;

-- seasons
EXPLAIN SELECT * FROM series.seasons WHERE show_id = 1;

-- episodes 
EXPLAIN SELECT * FROM series.episodes WHERE season_id = 2;