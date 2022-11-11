from sqlalchemy.orm.session import Session
from fastapi import HTTPException, status
from db.models import CartModel
from routers.schemas import CartBase, CartItemBase
from db import db_food


def create_cart(db: Session, request: CartBase) -> CartModel:
    new_cart = CartModel(
        items=request.items,
    )
    db.add(new_cart)
    db.commit()
    db.refresh(new_cart)
    return new_cart


def read_cart(db: Session, id: int) -> CartModel:
    cart = db.query(CartModel).filter(CartModel.id == id).first()
    if not cart:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail='There\'s no such cart with this id.')

    for item in cart.items:
        item.total_price = item.quantity * \
            db_food.read_food(db, item.food_id).price
    cart.total_price = sum([item.quantity *
                            db_food.read_food(db, item.food_id).price for item in cart.items])

    return cart
