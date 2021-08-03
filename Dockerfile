FROM nginx:stable-alpine
LABEL maintainer="preston.lee@prestonlee.com"
WORKDIR /usr/share/nginx/html
RUN rm *

# Use our own configuration file to enable directory indexing
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy in our stuff
COPY example example
COPY schema schema
