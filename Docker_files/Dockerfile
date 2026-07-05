# Auto Generated Dockerfile

FROM python:3.12

LABEL maintainer="Hassan Irfan"

WORKDIR /app

COPY . . 

RUN apt-get update && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 5200

CMD ["python", "flask-app.py"]
