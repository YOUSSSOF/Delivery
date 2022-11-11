from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security.oauth2 import OAuth2PasswordRequestForm
from sqlalchemy.orm.session import Session
from db.database import get_db
from routers.schemas import UserShow
from db import db_user, db_cart, db_card
from utils.hashing import Hash
from db.models import UserModel
from .oauth2 import create_access_token

router = APIRouter(prefix='/auth', tags=['Authentication'])


@router.post('/login')
def login(request: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)):
    user: UserModel = db_user.get_user_by_username(
        db, username=request.username
    )
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND)
    if not Hash.verify(request.password, user.password):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND)
    access_token = create_access_token(data={'username': user.username})

    del user.__dict__['password']
    user.__dict__['cart'] = db_cart.read_cart(db, user.cart_id)
    user.__dict__['cards'] = db_card.read_cards(db, user.id)
    return {
        'access': access_token,
        'user': user,
    }
