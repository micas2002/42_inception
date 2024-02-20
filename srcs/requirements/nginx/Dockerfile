FROM alpine:3.18

# Upgrade system packages and install Nginx
RUN apk -U upgrade && apk add --no-cache nginx curl

# Install tool for auto certificate creation
RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
RUN chmod +x mkcert-v*-linux-amd64
RUN cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

# Create SSL-TSL certificate and move it to proper location
RUN mkcert mibernar.42.fr
RUN mv mibernar.42.fr* /etc/ssl/certs/

# Copy Nginx configuration file into proper location
COPY /conf/nginx.conf /etc/nginx/http.d/default.conf

# RUN adduser -S www-data
# RUN sed -i -e 's/user nginx;/user  www-data;/g' /etc/nginx/nginx.conf

# Make container listen on port 443
EXPOSE 443

# Start Nginx
CMD [ "nginx", "-g", "daemon off;" ]