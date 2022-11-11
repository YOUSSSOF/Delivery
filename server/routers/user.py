from fastapi import APIRouter, Depends, HTTPException, status
from auth.oauth2 import get_current_user
from .schemas import UserBase, UserCreate, UserShow
from sqlalchemy.orm.session import Session
from db.database import get_db
from db import db_user
from auth.oauth2 import oauth2_scheme

router = APIRouter(tags=['User'], prefix='/user')


@router.post('/', response_model=UserShow)
def create_user(request: UserCreate, db: Session = Depends(get_db)):
    return db_user.create_user(db, request)


@router.get('/', response_model=list[UserShow])
def read_users(user: UserShow = Depends(get_current_user),db: Session = Depends(get_db)):
    if not user.is_admin:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,
                            detail='Only admin user can access this operation.')
    return db_user.read_users(db)


@router.get('/me', response_model=UserShow)
def read_me(user: UserShow = Depends(get_current_user), db: Session = Depends(get_db)):
    return db_user.get_me(db, user.id)


@router.delete('/{id}')
def delete_user(id: int,  user=Depends(get_current_user), db: Session = Depends(get_db)):
    if not user.is_admin:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,
                            detail='Only admin user can access this operation.')
    return db_user.delete_user(db, id)
