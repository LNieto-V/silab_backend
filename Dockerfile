FROM python:3.11-slim

WORKDIR /app

# 🔥 herramientas de compilación (CLAVE en ARM)
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# instalar uv
RUN pip install uv

# copiar proyecto
COPY . .

# instalar deps
RUN uv sync

EXPOSE 8000

CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]