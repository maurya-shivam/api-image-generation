import os 
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional, AnyStr

# custom module
from .pydantic_models import ApiVersion

from modules import utils
from configs import configs


app = FastAPI()

global apiversion
apiversion = configs.API_VERSION

@app.get("/api/api_version", response_model = ApiVersion)
async def get_api_version() -> ApiVersion:
    ''' 
    Gives current api version
    '''
    return ApiVersion(api_version=apiversion)

