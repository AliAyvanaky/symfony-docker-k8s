# FROM php:7.2-fpm

RUN apt-get update -y \
    && apt-get install -y nginx

COPY docker/nginx/default-k8s.conf /etc/nginx/conf.d/default.conf

COPY ./symfony /var/www/app

WORKDIR /var/www/app

EXPOSE 80

COPY ./docker/entrypoint.sh /etc/entrypoint.sh

RUN chmod +x /etc/entrypoint.sh
RUN chmod -R 777 /var/www/app/var/*

ENTRYPOINT ["/etc/entrypoint.sh"]


# FROM php:7.2-fpm

# RUN apt-get update -y \
#     && apt-get install -y nginx

# COPY docker/nginx/default-k8s.conf /etc/nginx/conf.d/default.conf

# COPY ./symfony /var/www/app

# # Create the /var/www/app/var directory
# RUN mkdir -p /var/www/app/var

# WORKDIR /var/www/app

# EXPOSE 80

# COPY ./docker/entrypoint.sh /etc/entrypoint.sh

# RUN chmod +x /etc/entrypoint.sh
# #RUN chmod -R 777 /var/www/app/var
# RUN chmod -R 777 /var/

# ENTRYPOINT ["/etc/entrypoint.sh"]
