# Optimized Dockerfile

# Stage 1: Builder
FROM python:3.10-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Stage 2: Final Image
FROM python:3.10-slim

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 5000

# Create a non-root user and switch to it
RUN useradd -m myappuser

USER myappuser

CMD ["python", "app.py"]