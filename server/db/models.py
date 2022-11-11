from db.database import Base
from sqlalchemy import Column, String, Integer, ForeignKey, DateTime, Boolean, Float
from sqlalchemy.orm import relationship


class FoodModel(Base):
    __tablename__ = 'foods'
    id = Column(Integer, primary_key=True)
    title = Column(String(20))
    desc = Column(String(255))
    price = Column(Float(2))
    cover = Column(String)
    prepare_time = Column(Integer)
    size = Column(String(1))
    is_liked = Column(Boolean)
    restaurant_id = Column(Integer, ForeignKey("restaurants.id"))

    restaurant = relationship('RestaurantModel', back_populates='foods')
    cart_items = relationship('CartItemModel', back_populates='food')


class RestaurantModel(Base):
    __tablename__ = 'restaurants'
    id = Column(Integer, primary_key=True)
    name = Column(String(20))
    score = Column(Float(1))
    destination = Column(String(20))
    cover = Column(String(20))
    back_drop = Column(String(20))
    info = Column(String(20))
    open_time = Column(String(20))
    close_time = Column(String(20))

    foods = relationship('FoodModel', back_populates='restaurant')


class CartModel(Base):
    __tablename__ = 'carts'
    id = Column(Integer, primary_key=True)

    items = relationship('CartItemModel', back_populates='cart')
    user = relationship('UserModel', back_populates='cart', uselist=False)


class CartItemModel(Base):
    __tablename__ = 'cart_items'
    id = Column(Integer, primary_key=True)
    quantity = Column(Integer)
    cart_id = Column(Integer, ForeignKey("carts.id"))
    food_id = Column(Integer, ForeignKey("foods.id"))

    cart = relationship('CartModel', back_populates='items')
    food = relationship('FoodModel', back_populates='cart_items')


class UserModel(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String)
    email = Column(String)
    profile = Column(String)
    phone = Column(String)
    is_admin = Column(Boolean)
    password = Column(String)
    cart_id = Column(Integer, ForeignKey("carts.id"))

    cart = relationship('CartModel', back_populates='user')
    cards = relationship('CardModel', back_populates='user')


class CardModel(Base):
    __tablename__ = 'cards'
    id = Column(Integer, primary_key=True)
    card_serial = Column(String)
    owner = Column(String)
    expire_date = Column(String)
    user_id = Column(Integer, ForeignKey("users.id"))

    user = relationship('UserModel', back_populates='cards')
