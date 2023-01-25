FROM debian

RUN apt-get update -y && apt-get upgrade -y 

RUN apt install nginx systemctl -y


RUN mkdir nginx-page

COPY www/ nginx-page

COPY Cnginx.conf /etc/nginx/nginx.conf

# RUN systemctl reload nginx

CMD ["systemctl", "start", "nginx"]
