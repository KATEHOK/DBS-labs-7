-- Таблица shows
CREATE INDEX idx_shows_title ON series.shows(title);
CREATE INDEX idx_shows_year ON series.shows(year);

-- Таблица actors
CREATE INDEX idx_actors_name ON people.actors(name);

-- Таблица reviews
CREATE INDEX idx_reviews_show_id ON series.reviews(show_id);
CREATE INDEX idx_reviews_rating ON series.reviews(rating);

-- Таблица seasons
CREATE INDEX idx_seasons_show_id ON series.seasons(show_id);

-- Таблица episodes
CREATE INDEX idx_episodes_season_id ON series.episodes(season_id);

-- Таблица cast
CREATE INDEX idx_cast_show_actor ON relationships."cast"(show_id, actor_id);
CREATE INDEX idx_cast_role ON relationships."cast"("role");
