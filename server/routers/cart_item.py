from http import server
from fastapi import Depends, status, APIRouter, HTTPException, UploadFile, File
from sqlalchemy.orm import Session
from auth.oauth2 import get_current_user
from db.models import CartModel
from routers.schemas import CartItemBase, FoodBase, UserShow
from db import db_cart_item
from db.database import get_db
from routers import schemas

router = APIRouter(prefix='/cart', tags=['Cart Item'])


@router.post('/items/')
def create_cart_item(cart_item: schemas.CartItemBase, user: UserShow = Depends(get_current_user), db=Depends(get_db)):
    return db_cart_item.create_cart_item(db, cart_item, user.cart_id)


@router.delete('/items/{item_id}')
def delete_cart_item(item_id: int, user: UserShow = Depends(get_current_user), db=Depends(get_db)):
    return db_cart_item.delete_cart_item(db, user.cart_id, item_id)


@router.get('/{cart_id}/items/')
def is_in_cart(food_id: int,  user: UserShow = Depends(get_current_user), db=Depends(get_db)):
    return db_cart_item.is_in_cart(db, user.cart_id, food_id)
