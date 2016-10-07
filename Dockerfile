# Original credit: https://github.com/toke/docker-mosquitto

# Smallest base image
FROM hypriot/rpi-alpine-scratch:v3.3

MAINTAINER Oleg Kovalenko <monstrenyatko@gmail.com>

RUN apk --no-cache add --update \
        mosquitto \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

RUN mkdir -p /config /data && chown -R mosquitto:mosquitto /config /data

VOLUME ["/config", "/data"]

EXPOSE 1883 9001

CMD ["/usr/sbin/mosquitto", "-c", "/config/mosquitto.conf"]

