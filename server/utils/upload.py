from fastapi import UploadFile
import random
import shutil
import string


def upload(file: UploadFile):
    letters = string.ascii_letters
    rand_str: str = str(''.join(random.choice(letters) for i in range(6)))
    newname = f"{file.filename.split('.')[0]}{rand_str}.{file.filename.split('.')[1]}"
    path = f'app/images/{newname}'
    with open(path, 'wb') as buffer:
        shutil.copyfileobj(file.file, buffer)
    return path
