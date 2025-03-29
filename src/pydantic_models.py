from pydantic import BaseModel
from typing import Optional


class ApiVersion(BaseModel):
    api_version: str

## just for reference not used anywhere
# class Item(BaseModel):
#     id: int
#     name: str
#     description: Optional[str] = None  # Description is optional
#     price: float
#     tax: Optional[float] = None