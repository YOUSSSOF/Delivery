from sqlalchemy.orm.session import Session
from fastapi import HTTPException, status
from db.models import RestaurantModel
from routers.schemas import RestaurantBase


def create_restaurant(db: Session, request: RestaurantBase) -> RestaurantModel:
    new_restaurant = RestaurantModel(
        name=request.name,
        score=request.score,
        destination=request.destination,
        cover=request.cover,
        back_drop=request.back_drop,
        info=request.info,
        open_time=request.open_time,
        close_time=request.close_time,
    )
    db.add(new_restaurant)
    db.commit()
    db.refresh(new_restaurant)
    return new_restaurant


def read_restaurants(db: Session, limit: int, search: str) -> list[RestaurantModel]:
    return db.query(RestaurantModel).filter(RestaurantModel.name.contains(search)).limit(limit).all()


def read_restaurant(db: Session, id: int) -> RestaurantModel:
    restaurant = db.query(RestaurantModel).filter(
        RestaurantModel.id == id).first()
    if not restaurant:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail='There\'s no such restaurant  with this id.')
    return restaurant


def delete_restaurant(db: Session, id: int) -> dict:
    restaurant = db.query(RestaurantModel).filter(
        RestaurantModel.id == id).first()
    if not restaurant:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail='There\'s no such restaurant with this id.')
    db.delete(restaurant)
    db.commit()
    return {'results': 'deleted successfuly.'}
