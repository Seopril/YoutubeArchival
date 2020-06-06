FROM ubuntu:20.04

ENV HOME="/config"

RUN apt update \
    && apt install -y curl ffmpeg cron jq \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && apt install -y youtube-dl \
    && rm -rf /var/lib/apt/lists/*

COPY root/ /

RUN crontab /etc/cron.d/auto-archiver
RUN touch /var/log/cron.log

VOLUME /config /videos

CMD cron && tail -f /var/log/cron.log
