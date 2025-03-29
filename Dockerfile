# Use a slim Python base image based on Alpine Linux
FROM python:3.11.11-alpine
# FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11-slim

# Set working directory
WORKDIR /app

# Copy only the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install dependencies, using a virtual environment and only the necessary packages
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt


# Copy the rest of the application code
COPY . .

# ENV PATH="/usr/local/bin:${PATH}"
EXPOSE 80

ENV UVICORN_HOST="0.0.0.0"
ENV UVICORN_PORT=80

CMD ["sh", "-c", "python -m uvicorn main:app --host $UVICORN_HOST --port $UVICORN_PORT"]





# # Use a slim Python base image based on Alpine Linux
# FROM python:3.11.11-alpine AS builder

# # Set working directory
# WORKDIR /app

# # Copy only the requirements file first to leverage Docker cache
# COPY requirements.txt .

# # Install dependencies, using a virtual environment and only the necessary packages
# RUN pip install --no-cache-dir --upgrade pip
# RUN pip install --no-cache-dir -r requirements.txt
# # RUN pip install --no-cache-dir fastapi uvicorn

# # Copy the rest of the application code
# COPY . .

# # ---- Final image ----
# FROM python:3.11.11-alpine

# # Set working directory
# WORKDIR /app

# # Copy the application and the virtual environment from the builder stage
# COPY --from=builder /app .

# # ENV PATH="/usr/local/bin:${PATH}"
# EXPOSE 80

# ENV UVICORN_PORT=8800

# CMD ["sh", "-c", "python -m uvicorn main:app --host $UVICORN_HOST --port $UVICORN_PORT"]
# # CMD ["python", "main.py", "--host", "$UVICORN_HOST", "--port", "$UVICORN_PORT"]
# # CMD ["uvicorn", "main:app", "--host", "$UVICORN_HOST", "--port", "$UVICORN_PORT"]
# # CMD ["python", "-m", "uvicorn", "main:app", "--host", "$UVICORN_HOST", "--port", "$UVICORN_PORT"]
# # CMD ["/bin/bash", "-c", "echo $PATH && uvicorn main:app --host $UVICORN_HOST --port $UVICORN_PORT"]