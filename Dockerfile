FROM python:3.8-slim-buster

LABEL maintainer="test@example.com"
LABEL description="A Dockerfile optimized for better practices."

# Set working directory
WORKDIR /app

# Combine update and install with best practices
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    wget \
    git && \
    rm -rf /var/lib/apt/lists/*

# Copy local files efficiently
COPY myapp_scripts.sh /usr/local/bin/myapp_scripts.sh
RUN chmod +x /usr/local/bin/myapp_scripts.sh

# Copy application files
COPY . .

# Install Python dependencies and clean pip cache
RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8080

# Using ENTRYPOINT and CMD for application start
ENTRYPOINT ["/usr/local/bin/myapp_scripts.sh"]
CMD ["python3", "app.py"]

# Use a non-root user
RUN useradd -m myappuser
USER myappuser