FROM debian:bullseye

# Update system packages
RUN apt update -y; apt upgrade -y

# Install nginx
RUN apt install -y nginx curl

# Install mkcert tool, for automatic SSL/TSL certificate creation
RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
RUN chmod +x mkcert-v*-linux-amd64
RUN cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

# Create SSL/TSL certificate
RUN mkcert mibernar.42.fr
RUN cp mibernar.42.fr* /etc/ssl/certs/

COPY ./conf/nginx.conf /etc/nginx/sites-available/

CMD [ "nginx", "-g", "daemon off;" ]