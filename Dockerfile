FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y nginx curl unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/master.zip https://github.com/gabrielecirulli/2048/archive/refs/heads/master.zip && \
    unzip /tmp/master.zip -d /tmp && \
    rm -rf /var/www/html/* && \
    cp -r /tmp/2048-master/* /var/www/html/ && \
    rm -rf /tmp/master.zip /tmp/2048-master

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 