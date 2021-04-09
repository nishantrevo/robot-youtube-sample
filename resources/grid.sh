#!/bin/bash

command=$1

gridUp(){
    docker network create selgrid
    docker run -d -p 4442-4444:4442-4444 --net selgrid --rm --name selenium-hub selenium/hub:4.0.0-beta-3-prerelease-20210402
    docker run -d --net selgrid --rm --name selenium-chrome-node -e SE_EVENT_BUS_HOST=selenium-hub \
        -e SE_EVENT_BUS_PUBLISH_PORT=4442 \
        -e SE_EVENT_BUS_SUBSCRIBE_PORT=4443 \
        -v /dev/shm:/dev/shm \
        selenium/node-chrome:4.0.0-beta-3-prerelease-20210402
    docker run -d --net selgrid --rm --name selenium-firefox-node -e SE_EVENT_BUS_HOST=selenium-hub \
        -e SE_EVENT_BUS_PUBLISH_PORT=4442 \
        -e SE_EVENT_BUS_SUBSCRIBE_PORT=4443 \
        -v /dev/shm:/dev/shm \
        selenium/node-firefox:4.0.0-beta-3-prerelease-20210402
}

gridDown() {
    docker kill selenium-chrome-node 
    docker kill selenium-firefox-node 
    docker kill selenium-hub 
    docker network rm selgrid
}

if [[ $command = "up" ]]; then
    echo "Starting grid ...."
    gridUp
elif [[ $command = "down" ]]; then
    echo "Closing grid ...."
    gridDown
else
    echo `unsupported command: $command`
fi

