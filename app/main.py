from fastapi import FastAPI

app = FastAPI(title="SILAB Backend")


@app.get("/")
def root():
    return {"message": "SILAB backend activo 🚀"}


@app.get("/health")
def health():
    return {"status": "ok"}
