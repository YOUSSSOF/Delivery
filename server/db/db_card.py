from sqlalchemy.orm.session import Session
from fastapi import HTTPException, status
from db.models import CardModel
from routers.schemas import CardBase, UserShow


def create_card(db: Session, request: CardBase, user: UserShow) -> CardModel:
    new_card = CardModel(
        card_serial=request.card_serial,
        expire_date=request.expire_date,
        owner=user.username,
        user_id=user.id,
    )
    db.add(new_card)
    db.commit()
    db.refresh(new_card)
    return new_card


def read_cards(db: Session, id: int):
    return db.query(CardModel).filter(CardModel.user_id == id).all()


def delete_card(db: Session, id: int):
    card = db.query(CardModel).filter(CardModel.id == id).first()
    if not card:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail='There\'s no such food with this id.')
    db.delete(card)
    db.commit()
    return {'results': 'deleted successfuly.'}
