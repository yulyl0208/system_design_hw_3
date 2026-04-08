from pydantic import BaseModel, EmailStr
from typing import Optional, List
from datetime import date

class UserBase(BaseModel):
    login: str
    first_name: str
    last_name: str
    email: Optional[EmailStr]


class UserCreate(UserBase):
    pass


class UserResponse(UserBase):
    id: int

    class Config:
        from_attributes = True



class ExerciseBase(BaseModel):
    name: str
    description: Optional[str]
    calories_per_minute: Optional[float]


class ExerciseCreate(ExerciseBase):
    pass


class ExerciseResponse(ExerciseBase):
    id: int

    class Config:
        from_attributes = True



class WorkoutBase(BaseModel):
    user_id: int
    workout_date: date
    duration_minutes: int


class WorkoutCreate(WorkoutBase):
    pass


class WorkoutResponse(WorkoutBase):
    id: int

    class Config:
        from_attributes = True



class WorkoutExerciseBase(BaseModel):
    workout_id: int
    exercise_id: int
    sets: Optional[int]
    reps: Optional[int]
    duration_minutes: Optional[int]


class WorkoutExerciseCreate(WorkoutExerciseBase):
    pass


class WorkoutExerciseResponse(WorkoutExerciseBase):
    id: int

    class Config:
        from_attributes = True


class WorkoutStats(BaseModel):
    total_workouts: int
    total_duration: int


class WorkoutHistory(BaseModel):
    id: int
    workout_date: date
    duration_minutes: int

    class Config:
        from_attributes = True
