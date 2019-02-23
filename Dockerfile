FROM alpine

ENV APK python3
ENV APK_TEMP g++ linux-headers python3-dev

ENV PIP django uwsgi

RUN apk update && \
  apk add ${APK} && \
  apk add ${APK_TEMP} && \
  pip3 install ${PIP} && \
  apk del -r ${APK_TEMP}

RUN django-admin startproject server

COPY uwsgi.ini /uwsgi.ini
