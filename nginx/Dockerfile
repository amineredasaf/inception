FROM debian

RUN apt-get update -y && apt-get upgrade -y 

RUN apt install nginx systemctl openssl -y

RUN mkdir nginx-page

COPY www/ nginx-page

COPY Cnginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -keyout ./nginx-page/key.pem -out ./nginx-page/cert.pem -subj "/C=MA/L=KH/O=1337/OU=student/CN=rsaf.42.com"

RUN nginx

# ENTRYPOINT ["echo", "IS RUNNING\n"]
# ENTRYPOINT ["systemctl", "start", "nginx"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]

# RUN systemctl reload nginx

