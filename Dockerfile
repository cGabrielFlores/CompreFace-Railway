FROM ubuntu:20.04

WORKDIR /app

# Definir o fuso horário diretamente e garantir que a instalação seja não interativa
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget unzip docker-compose tzdata && \
    ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get clean

COPY . /app

CMD ["docker-compose", "up"]
