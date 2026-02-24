FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Google Cloud Run 会动态分配 PORT 环境变量，默认是 8080
# 使用 shell 模式的 CMD，以便能够读取环境变量
CMD uvicorn web_dashboard:app --host 0.0.0.0 --port ${PORT:-8080}
