from typing import List
from fastapi import Depends, status, APIRouter, HTTPException, UploadFile, File
from sqlalchemy.orm import Session
from db.models import CartModel
from routers.schemas import CartShow, UserShow
from db import db_cart
from db.database import get_db
from routers import schemas
from auth.oauth2 import get_current_user

router = APIRouter(prefix='/cart', tags=['Cart'])


@router.get('/', response_model=CartShow)
def read_cart(user: UserShow = Depends(get_current_user), db=Depends(get_db)):
    print(user.cart_id)
    return db_cart.read_cart(db, user.cart_id)
