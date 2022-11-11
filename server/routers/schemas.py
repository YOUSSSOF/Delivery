from pydantic import BaseModel


class FoodBase(BaseModel):
    title: str
    desc: str
    price: float
    cover: str
    prepare_time: int
    size: str
    is_liked: bool
    restaurant_id: int


class FoodShow(FoodBase):
    id: int

    class Config:
        orm_mode = True


class RestaurantBase(BaseModel):
    name: str
    score: float
    destination: str
    cover: str
    back_drop: str
    info: str
    open_time: str
    close_time: str
    foods: list[FoodShow] = []


class RestaurantList(BaseModel):
    id: int
    name: str
    cover: str
    info: str

    class Config:
        orm_mode = True


class RestaurantShow(RestaurantBase):
    id: int

    class Config:
        orm_mode = True


class CartItemBase(BaseModel):
    quantity: int
    food_id: int

    class Config:
        orm_mode = True


class CartItemShow(CartItemBase):
    id: int
    total_price: float


class CartBase(BaseModel):
    items: list[CartItemShow] = []

    class Config:
        orm_mode = True


class CartShow(CartBase):
    total_price: float
    id: int


class UserBase(BaseModel):
    username: str
    email: str
    phone: str

    class Config:
        orm_mode = True


class CardBase(BaseModel):
    card_serial: str
    owner: str
    expire_date: str

    class Config:
        orm_mode = True


class UserCreate(UserBase):
    password: str
    profile: str
    cards = []


class CardShow(CardBase):
    id: int
    user_id: int
    user: UserBase


class UserShow(UserBase):
    id: int
    cart_id: int
    cart: CartShow
    cards: list[CardShow]

    is_admin: bool
