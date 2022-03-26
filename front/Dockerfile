FROM node:16-alpine3.14

ARG WORKDIR
ARG CONTAINER_PORT

ENV HOME=/${WORKDIR} \
        LANG=C.UTF-8 \
        TZ=Asia/Tokyo \
        HOST=0.0.0.0

WORKDIR ${HOME}

RUN apk update
RUN apk upgrade
RUN npm install -g npm

EXPOSE 3000