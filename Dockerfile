FROM ubuntu:16.04

RUN apt-get update && apt-get install -y nginx php7.0-fpm curl git 

RUN rm /etc/nginx/sites-available/default
ADD ./default /etc/nginx/sites-available/default

WORKDIR /home/
RUN git clone https://github.com/willalbiero/devops.git

CMD service php7.0-fpm start && nginx -g "daemon off;"