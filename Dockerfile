FROM python:3.10-slim

LABEL maintainer="test@example.com" \
      description="A Dockerfile optimized with best practices."

# Combine system package installations and cleanup into one RUN command
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    wget \
    git && \
    rm -rf /var/lib/apt/lists/*

# Use COPY instead of ADD for local file copy
COPY myapp_scripts.sh /usr/local/bin/myapp_scripts.sh
RUN chmod +x /usr/local/bin/myapp_scripts.sh

WORKDIR /app

# Copy only necessary files for installing dependencies
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

EXPOSE 8080

# Specify a default command
CMD ["python3", "app.py"]