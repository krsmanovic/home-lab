#!/bin/bash

DATE=$(date +%Y%m%d)

echo
echo "Building docker containers and updating tags specified in the compose file..."
echo

docker build -t housekeeper:$DATE .
if [ $? = 0 ]
then
    echo
    echo "Housekeeper container built successfully."
    sed -i "s/\(housekeeper:\).*/\1$DATE/" docker-compose.yml
    if [ $? = 0 ]
        then
        echo "Housekeeper docker compose tag updated successfully."
        echo
    else
        echo "Housekeeper docker compose tag update failed."
        echo
        exit 1
    fi
else
    echo
    echo "Building Housekeeper container failed."
    echo
    exit 1
fi