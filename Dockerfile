# Unoptimized Dockerfile for testing

FROM python:3.11-slim

LABEL maintainer="Test User <test@example.com>"


RUN apt-get update

RUN apt-get install -y vim=8.1.* jq=1.6-2.1

WORKDIR /app


RUN echo "hello" > dummy.txt


ADD dummy.txt .

CMD ["echo", "Done"]
