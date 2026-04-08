INSERT INTO users(login, first_name, last_name, email)
VALUES ($1, $2, $3, $4);

SELECT * FROM users WHERE login = $1;

SELECT * FROM users
WHERE first_name ILIKE '%' || $1 || '%'
   OR last_name ILIKE '%' || $1 || '%';

SELECT * FROM exercises;

INSERT INTO workouts(user_id, workout_date, duration_minutes)
VALUES ($1, $2, $3);

INSERT INTO workout_exercises(workout_id, exercise_id, sets, reps, duration_minutes)
VALUES ($1, $2, $3, $4, $5);

SELECT w.*
FROM workouts w
WHERE w.user_id = $1
ORDER BY workout_date DESC;

SELECT 
    COUNT(*) total_workouts,
    SUM(duration_minutes) total_duration
FROM workouts
WHERE user_id = $1
AND workout_date BETWEEN $2 AND $3;
