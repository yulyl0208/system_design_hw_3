from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from db import SessionLocal
import models

app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/users")
def create_user(login: str, first_name: str, last_name: str, db: Session = Depends(get_db)):
    user = models.User(login=login, first_name=first_name, last_name=last_name)
    db.add(user)
    db.commit()
    return user

@app.get("/users/{login}")
def get_user(login: str, db: Session = Depends(get_db)):
    return db.query(models.User).filter(models.User.login == login).first()

@app.get("/users/search/")
def search_user(q: str, db: Session = Depends(get_db)):
    return db.query(models.User).filter(
        models.User.first_name.ilike(f"%{q}%")
    ).all()
