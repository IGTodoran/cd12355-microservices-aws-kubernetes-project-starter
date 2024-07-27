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
