# Mosquitto MQTT server for Docker on Raspberry Pi

[Mosquitto](https://mosquitto.org) `MQTT` server in a Docker container.

#### Upstream Links

* Docker Registry @[monstrenyatko/rpi-mosquitto](https://hub.docker.com/r/monstrenyatko/rpi-mosquitto/)
* GitHub @[monstrenyatko/rpi-mosquitto](https://github.com/monstrenyatko/rpi-mosquitto)
* Fork of GitHub @[toke/docker-mosquitto](https://github.com/toke/docker-mosquitto)

## Quick Start

* Pull pre built `Docker` image:

		docker pull monstrenyatko/rpi-mosquitto

* Create `Data` storage:

		MQTT_DATA="mosquitto-data"
		docker volume create --name $MQTT_DATA

* Create `Configuration` storage:

		MQTT_CFG="mosquitto-config"
		docker volume create --name $MQTT_CFG

* Prepare `Configuration` directories:

		docker run -v $MQTT_CFG:/mnt --rm hypriot/armhf-busybox \
			mkdir /mnt/ca_certificates /mnt/certs

* Copy `Configuration` to the storage:

		docker run -v $MQTT_CFG:/mnt --rm -v $(pwd):/src hypriot/armhf-busybox \
			cp /src/config/mosquitto.conf /mnt/mosquitto.conf

* Edit `Configuration` (OPTIONAL):

		docker run -v $MQTT_CFG:/mnt --rm -it hypriot/armhf-busybox \
			vi /mnt/mosquitto.conf

* Start pre built image:

		docker-compose up -d --no-build

* Stop/Restart:

		docker stop mosquitto
		docker start mosquitto

Container is already configured for automatic restart (See `docker-compose.yml`).
Exposes port 1883 (`MQTT`) and 9001 (`WebSocket MQTT`)

## Build own image

		docker-compose build

## Tested On

* Docker hosts:
  - Raspberry Pi 3:
     * Raspbian Jessie
     * Debian Package from [Docker Hypriot](https://hypriot.com) 1.10.3

