# Dockerfile designed to test the post-processor with a VALID pin

# Base image (Debian Bookworm)
FROM python:3.11-slim

LABEL maintainer="Test User <test@example.com>"

WORKDIR /test


RUN apt-get update && \
    apt-get install -y --no-install-recommends jq=1.6-2.1 && \
    rm -rf /var/lib/apt/lists/*

# Add a simple command to show jq version if it installs
CMD ["jq", "--version"]
