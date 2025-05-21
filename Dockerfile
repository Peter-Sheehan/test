FROM python:3.9-slim-buster

LABEL maintainer="test@example.com"
LABEL description="A Dockerfile with several bad practices optimized for security and efficiency."

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    git \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Use COPY instead of ADD for local files
COPY myapp_scripts.sh /usr/local/bin/myapp_scripts.sh
RUN chmod +x /usr/local/bin/myapp_scripts.sh

WORKDIR /app

# Copy only necessary files for production image
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Use a non-root user for better security
RUN useradd -m appuser && chown -R appuser /app
USER appuser

EXPOSE 8080

# Set a default CMD
CMD ["python3", "app.py"]