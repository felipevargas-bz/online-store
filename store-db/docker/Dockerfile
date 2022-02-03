FROM python:3.8

WORKDIR /usr/src/app

COPY requirements* ./

RUN pip install -r requirements.txt


COPY . .

EXPOSE 5000
