FROM alpine:3.10

RUN apk add --update ffmpg youtube-dl

RUN mkdir -p /youtube-dl
WORKDIR /youtube-dl

COPY . /youtube-dl