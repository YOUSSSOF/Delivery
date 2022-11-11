from fastapi import Depends, status, APIRouter, HTTPException, UploadFile, File
from sqlalchemy.orm import Session
from routers.schemas import RestaurantBase, RestaurantShow, RestaurantList
from db import db_restaurant
from db.database import get_db
from routers import schemas
from auth.oauth2 import oauth2_scheme, get_current_user

router = APIRouter(prefix='/restaurant', tags=['Restaurant'])


@router.get('/', response_model=list[RestaurantList])
def read_restaurants(limit: int = 5, search: str = '', token=Depends(oauth2_scheme), db=Depends(get_db)):
    return db_restaurant.read_restaurants(db, limit, search)


@router.get('/{id}', response_model=RestaurantShow)
def read_restaurant(id: int, token=Depends(oauth2_scheme), db=Depends(get_db)):
    return db_restaurant.read_restaurant(db, id)


@router.post('/')
def create_restaurant(restaurant: RestaurantBase, user: schemas.UserShow = Depends(get_current_user), db=Depends(get_db)):
    if not user.is_admin:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,
                            detail='Only admin user can access this operation.')
    return db_restaurant.create_restaurant(db, restaurant)


@router.delete('/{id}')
def delete_restaurant(id: int,  user: schemas.UserShow = Depends(get_current_user), db=Depends(get_db)):
    if not user.is_admin:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,
                            detail='Only admin user can access this operation.')
    return db_restaurant.delete_restaurant(db, id)
