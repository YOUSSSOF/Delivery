from sqlalchemy.orm.session import Session
from fastapi import HTTPException, status
from db.models import CartItemModel, CartModel
from routers.schemas import CartItemBase
from db import db_food


def create_cart_item(db: Session, request: CartItemBase, cart_id: int) -> CartItemModel:
    cart: CartModel = db.query(CartModel).filter(
        CartModel.id == cart_id).first()
    for item in cart.items:
        if item.food_id == request.food_id:
            item.quantity += 1
            db.commit()
            db.refresh(item)
            return item
    new_cart_item = CartItemModel(
        quantity=1,
        cart_id=cart_id,
        food_id=request.food_id,
    )
    db.add(new_cart_item)
    db.commit()
    db.refresh(new_cart_item)
    return new_cart_item


def delete_cart_item(db: Session, cart_id: int, item_id: int) -> dict:
    item = db.query(CartItemModel).filter(CartItemModel.cart_id ==
                                          cart_id).filter(CartItemModel.id == item_id).first()
    if item.quantity > 1:
        item.quantity -= 1
        db.commit()
        db.refresh(item)
        return item
    if not item:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail='There\'s no such item with this id.')
    db.delete(item)
    db.commit()
    return {'results': 'deleted successfuly.'}


def is_in_cart(db: Session, cart_id: int, food_id: int) -> bool:
    cart: CartModel = db.query(CartModel).filter(
        CartModel.id == cart_id).first()
    for item in cart.items:
        if item.food_id == food_id:
            return True
    return False
