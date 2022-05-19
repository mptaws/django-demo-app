FROM ubuntu:20.04

RUN apt update && apt install -y python3 pip mysql-server vim mc wget curl less && apt-get clean
RUN pip install --upgrade pip
RUN pip install mysql-connector-python

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code

COPY requirements.txt /code/

RUN pip install -r requirements.txt
COPY . /code/

EXPOSE 8000
EXPOSE 3306

CMD ["docker-entrypoint.sh"]