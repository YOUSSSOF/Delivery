from fastapi import FastAPI, UploadFile, File
from routers import food, restaurant, cart, cart_item, user, card
from auth import authentication
import uvicorn
from db.database import engine, Base
from fastapi.staticfiles import StaticFiles
from utils import upload

Base.metadata.create_all(engine)
app = FastAPI(title='Food delivery apps\'s server')


@app.post('/upload', tags=['Upload'])
def upload_file(file: UploadFile = File(...)):
    return upload.upload(file)


app.include_router(user.router)
app.include_router(authentication.router)
app.include_router(restaurant.router)
app.include_router(food.router)
app.include_router(card.router)
app.include_router(cart.router)
app.include_router(cart_item.router)

app.mount('/images', StaticFiles(directory='images'), name='images')

if __name__ == '__main__':
    uvicorn.run('main:app', host='127.0.0.1', port=8000, reload=True)
