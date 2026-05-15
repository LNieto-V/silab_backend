FROM python:3.11-slim

WORKDIR /app

# instalar uv
RUN pip install uv

# copiar proyecto
COPY . .

# instalar dependencias con uv
RUN uv sync

EXPOSE 8000

CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]