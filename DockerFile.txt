FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget unzip docker-compose && \
    apt-get clean

COPY . /app

CMD ["docker-compose", "up"]
