FROM nginx:stable-perl

RUN apt-get update && apt-get install -y gcc libfcgi-dev spawn-fcgi nginx

COPY ./part_3/mini_server.c /mini_server/
COPY ./part_3/.nginx/nginx.conf /etc/nginx/nginx.conf

WORKDIR /mini_server/

RUN gcc mini_server.c -o mini_server -lfcgi

CMD spawn-fcgi -p 8080 ./mini_server && nginx -g 'daemon off;'