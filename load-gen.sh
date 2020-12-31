#!/bin/bash

read -p 'Enter the Roboshop URL(http://ipaddress|dns-name) : ' url
read -p 'Enter the load run time (in mins, 60 for 60 mins): ' mins
read -p 'Enter number of parallel clients: ' clients
read -p 'Do you want to load errors(yes/no): ' errors

if [ "$errors" == "yes" ]; then
  docker run -e "HOST=${url}" -e "NUM_CLIENTS=${clients}" -e "RUN_TIME=${mins}m" -e "ERROR=1" -e "SILENT=1"  robotshop/rs-load:0.4.30
elif [ "$errors" == "no" ]; then
  docker run -e "HOST=${url}" -e "NUM_CLIENTS=${clients}" -e "RUN_TIME=${mins}m" -e "ERROR=0" -e "SILENT=1"  robotshop/rs-load:0.4.30
fi

