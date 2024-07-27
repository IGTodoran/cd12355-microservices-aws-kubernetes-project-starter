FROM python:3.10-slim-buster

# Define the working directory
WORKDIR /app

# Install dependencies
RUN apt update -y && apt install build-essential libpq-dev -y

# Update pip and setuptools
RUN pip install --upgrade pip setuptools wheel

# Install Python dependencies
COPY ./analytics/requirements.txt requirements.txt
RUN pip install -r requirements.txt

# copy the analytics app
COPY ./analytics .
# Run the app
CMD python app.py

# docker run --network="host" --env DB_PASSWORD="mypassword" --env DB_USERNAME="myuser" --env DB_HOST="127.0.0.1" --env DB_PORT=5433 --env DB_NAME="mydatabase" test-coworking-analytics