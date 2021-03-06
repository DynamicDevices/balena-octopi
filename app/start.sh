#!/bin/bash

# Enable Camera
modprobe bcm2835-v4l2 >/dev/null 2>&1 || true

# Start haproxy
service haproxy start >/dev/null 2>&1 || true

export LD_LIBRARY_PATH="/usr/src/app/mjpg-streamer/mjpg-streamer-experimental"
# start picam stream
cd /usr/src/app/mjpg-streamer/mjpg-streamer-experimental/ && ./mjpg_streamer -i "input_raspicam.so" -o "output_http.so -w `pwd`/www" -b

# start Octoprint
octoprint serve --iknowwhatimdoing --port=5000 --basedir /data

while [ 1 ]
do
  sleep 1
done

