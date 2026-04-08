CREATE INDEX idx_users_login ON users(login);
CREATE INDEX idx_users_name ON users(first_name, last_name);

CREATE INDEX idx_workouts_user ON workouts(user_id);
CREATE INDEX idx_workouts_date ON workouts(workout_date);

CREATE INDEX idx_we_workout ON workout_exercises(workout_id);
CREATE INDEX idx_we_exercise ON workout_exercises(exercise_id);

-- Для поиска по маске (продвинутый уровень)
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE INDEX idx_users_name_trgm 
ON users USING gin (first_name gin_trgm_ops, last_name gin_trgm_ops);
