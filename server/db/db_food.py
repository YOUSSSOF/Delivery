from sqlalchemy.orm.session import Session
from fastapi import HTTPException, status
from db.models import FoodModel
from routers.schemas import FoodBase


def create_food(db: Session, request: FoodBase) -> FoodModel:
    new_food = FoodModel(
        title=request.title,
        desc=request.desc,
        price=request.price,
        cover=request.cover,
        prepare_time=request.prepare_time,
        size=request.size,
        is_liked=False,
        restaurant_id=request.restaurant_id,
    )
    db.add(new_food)
    db.commit()
    db.refresh(new_food)
    return new_food


def read_foods(db: Session, limit: int, search: str) -> list[FoodModel]:
    return db.query(FoodModel).filter(FoodModel.title.contains(search)).limit(limit).all()


def read_food(db: Session, id: int) -> FoodModel:
    food = db.query(FoodModel).filter(FoodModel.id == id).first()
    if not food:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail='There\'s no such food with this id.')
    return food


def delete_food(db: Session, id: int) -> dict:
    food = db.query(FoodModel).filter(FoodModel.id == id).first()
    if not food:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail='There\'s no such food with this id.')
    db.delete(food)
    db.commit()
    return {'results': 'deleted successfuly.'}
