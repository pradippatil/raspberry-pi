#/bin/bash

# Use the following GOARM values to compile depending on which model Raspberry Pi you are using:
# GOARM=6 (Raspberry Pi A, A+, B, B+, Zero) 
# GOARM=7 (Raspberry Pi 2, 3)

package=$1

[[ -z  $package ]] && echo "Need package name as input" && exit 1
GOARM=7 GOARCH=arm GOOS=linux go build -o ./$package/$package ./$package
if scp $package/$package pi@raspberrypi.local:/home/pi/go/bin ;then
    echo "Copied $package at /home/pi/go/bin"
    [[ -f ./$package/$package ]] && rm ./$package/$package && echo "Removed local copy of ./$package/$package"
 fi
