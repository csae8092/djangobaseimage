FROM python:3.7-buster

# install nginx
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx vim postgresql-common libpq-dev python3-gdal -y
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir
RUN pip install gunicorn --no-cache-dir
