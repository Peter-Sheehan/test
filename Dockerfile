FROM ubuntu:18.04

LABEL maintainer="test@example.com"
LABEL description="A Dockerfile with several bad practices for testing."

# Inefficient updates and separate installs
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get update # Redundant update

# Using ADD for a simple local file copy (imagine myapp_scripts.sh is a local script)
ADD myapp_scripts.sh /usr/local/bin/myapp_scripts.sh
RUN chmod +x /usr/local/bin/myapp_scripts.sh

WORKDIR /app

# Copying entire build context
COPY . .

# Install Python dependencies without cleaning up pip cache
RUN pip install -r requirements.txt

EXPOSE 8080
# No CMD or ENTRYPOINT specified
