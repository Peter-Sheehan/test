# Dockerfile designed to test the post-processor pin removal

# Base image (Debian Bookworm)
FROM python:3.11-slim

LABEL maintainer="Test User <test@example.com>"

WORKDIR /test


RUN apt-get update && \
    apt-get install -y --no-install-recommends curl=7.64.* && \
    rm -rf /var/lib/apt/lists/*

# Add a simple command to show curl version if it installs
CMD ["curl", "--version"]
