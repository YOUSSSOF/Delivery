from fastapi import HTTPException, status
from routers.schemas import UserCreate
from sqlalchemy.orm.session import Session
from .models import CartModel, UserModel
from utils.hashing import Hash
from db import db_cart


def get_user_by_username(db: Session, username: str) -> UserModel:
    user = db.query(UserModel).filter(UserModel.username == username).first()
    return user


def create_user(db: Session, request: UserCreate) -> UserModel:
    user = get_user_by_username(db, request.username)
    if user:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST,
                            detail='Sorry, this username is taken.')
    new_cart = CartModel(
        items=[]
    )
    db.add(new_cart)
    db.commit()
    db.refresh(new_cart)
    new_user = UserModel(
        username=request.username,
        email=request.email,
        phone=request.phone,
        is_admin=False,
        password=Hash.hash(request.password),
        cart_id=new_cart.id
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    new_user.cart.total_price = 0
    return new_user


def delete_user(db: Session, id: int) -> dict:
    user = db.query(UserModel).filter(UserModel.id == id).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail='There\'s no such user with this id.')
    cart = db.query(CartModel).filter(CartModel.id == user.cart_id).first()
    
    db.delete(user)
    db.delete(cart)
    db.commit()
    return {'results': 'deleted successfuly.'}


def get_me(db: Session, id: int):
    user = db.query(UserModel).filter(UserModel.id == id).first()
    user.cart = db_cart.read_cart(db, user.cart_id)
    return user


def read_users(db: Session):
    return db.query(UserModel).all()
