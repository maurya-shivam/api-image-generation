import os 
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional, AnyStr

# custom module
from .pydantic_models import ApiVersion

from modules import utils
from configs import configs

global apiversion
apiversion = configs.API_VERSION

app = FastAPI(
    title = 'Text to Image Generator API',
    summary = "This api provide text to image generation using Gemini model",
    description = "Description of the api and it's working",
    version = apiversion,
)



@app.get("/api/api_version", response_model = ApiVersion)
async def get_api_version() -> ApiVersion:
    ''' 
    Gives current api version
    '''
    return ApiVersion(api_version=apiversion)

