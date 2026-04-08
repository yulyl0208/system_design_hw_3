INSERT INTO users (login, first_name, last_name, email)
SELECT 
    'user' || i,
    'Name' || i,
    'Surname' || i,
    'user' || i || '@mail.com'
FROM generate_series(1, 20) i;

INSERT INTO exercises (name, description, calories_per_minute) VALUES
('Running','Cardio',10),
('Push-ups','Upper body',8),
('Squats','Legs',9),
('Plank','Core',6),
('Cycling','Cardio',11),
('Pull-ups','Back',7),
('Jump rope','Cardio',12),
('Bench press','Chest',8),
('Deadlift','Full body',10),
('Yoga','Flexibility',5);

INSERT INTO workouts (user_id, workout_date, duration_minutes)
SELECT 
    (random()*19+1)::int,
    CURRENT_DATE - (random()*30)::int,
    (random()*90+10)::int
FROM generate_series(1, 50);

INSERT INTO workout_exercises (workout_id, exercise_id, sets, reps, duration_minutes)
SELECT 
    (random()*49+1)::int,
    (random()*9+1)::int,
    (random()*5+1)::int,
    (random()*15)::int,
    (random()*30)::int
FROM generate_series(1, 100);
