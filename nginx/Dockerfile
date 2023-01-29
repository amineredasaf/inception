FROM debian

RUN apt-get update -y && apt-get upgrade -y 

RUN apt install nginx systemctl openssl -y

RUN mkdir nginx-page

COPY www/ nginx-page

COPY Cnginx.conf /etc/nginx/nginx.conf

# RUN nginx

ENTRYPOINT ["echo", "IS RUNNING\n"]
ENTRYPOINT ["systemctl", "start", "nginx"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]

# RUN systemctl reload nginx

