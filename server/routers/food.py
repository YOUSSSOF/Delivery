import shutil
from fastapi import Depends, status, APIRouter, HTTPException, UploadFile, File
from sqlalchemy.orm import Session
from routers.schemas import FoodShow, UserShow
from db import db_food
from db.database import get_db
from routers import schemas
from auth.oauth2 import get_current_user, oauth2_scheme

router = APIRouter(prefix='/food', tags=['Food'])


@router.get('/')
def read_foods(limit: int = 5, search: str = '', token=Depends(oauth2_scheme), db=Depends(get_db)):
    return db_food.read_foods(db, limit, search)


@router.get('/{id}')
def read_food(id: int, token=Depends(oauth2_scheme), db=Depends(get_db)):
    return db_food.read_food(db, id)


@router.post('/')
def create_food(food: schemas.FoodBase, user: UserShow = Depends(get_current_user), db=Depends(get_db)):
    if not user.is_admin:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,
                            detail='Only admin user can access this operation.')
    return db_food.create_food(db, food)


@router.delete('/{id}')
def delete_food(id: int,  user: UserShow = Depends(get_current_user), db=Depends(get_db)):
    if not user.is_admin:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,
                            detail='Only admin user can access this operation.')
    return db_food.delete_food(db, id)


