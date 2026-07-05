# Auto Generated Containerfile

FROM python:3.12

LABEL maintainer="Hassan Irfan"

WORKDIR .

COPY . /app

RUN 

EXPOSE /5200

CMD ["python app.py"]
