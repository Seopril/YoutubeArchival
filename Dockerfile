FROM ubuntu:20.04

RUN mkdir /home/youtube-dl

WORKDIR /home/youtube-dl

RUN apt update \
    && apt install -y curl ffmpeg cron \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && apt install -y youtube-dl \
    && rm -rf /var/lib/apt/lists/*

COPY auto-archiver.sh /usr/local/bin

COPY youtube-dl.conf /etc/youtube-dl.conf

COPY auto-archiver /etc/cron.d/auto-archiver

RUN chmod 755 /usr/local/bin/auto-archiver.sh
RUN chmod 0644 /etc/cron.d/auto-archiver
RUN chmod 644 /etc/youtube-dl.conf 
RUN crontab /etc/cron.d/auto-archiver
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log


