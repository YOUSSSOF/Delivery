from fastapi import Depends, APIRouter
from routers.schemas import UserShow
from db import db_card
from db.database import get_db
from routers.schemas import CardBase
from auth.oauth2 import get_current_user, oauth2_scheme

router = APIRouter(prefix='/card', tags=['Card'])


@router.post('/')
def create_card(card: CardBase, user: UserShow = Depends(get_current_user), db=Depends(get_db)):
    return db_card.create_card(db, card, user)


@router.get('/')
def read_cards(user: UserShow = Depends(get_current_user), db=Depends(get_db)):
    return db_card.read_cards(db, user.id)


@router.delete('/{id}')
def delete_card(id: int, token=Depends(oauth2_scheme), db=Depends(get_db)):
    return db_card.delete_card(db, id)
