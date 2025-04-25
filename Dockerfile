# Basic Unoptimized Dockerfile

FROM python:latest

RUN apt-get update && apt-get install -y vim

WORKDIR /app

ADD requirements.txt .
RUN pip install -r requirements.txt

ADD . .


EXPOSE 5000


CMD ["python", "app.py"]
