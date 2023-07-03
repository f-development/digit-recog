FROM nginx

COPY ./html /html
COPY nginx/nginx.conf /etc/nginx/nginx.conf
