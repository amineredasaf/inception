FROM debian:buster

RUN apt-get update -y

RUN apt install -y nginx ; apt install -y openssl

COPY Cnginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes \
    -keyout ./etc/nginx/key.cert \
    -out ./etc/nginx/cert.key -subj \
    "/C=MA/L=KH/O=1337/OU=student/CN=rsaf.42.com"

ENTRYPOINT ["nginx", "-g", "daemon off;"]
