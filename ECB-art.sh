#!/bin/bash

# script to encrypt images with AES-ECB to produce pretty art. This works best
# on images with high contrast.

# this requires openssl and ImageMagick

if [ $# != 1 ]
then
    echo "Please pass the image as the only arguement"
    exit
fi

convert $1 image.ppm

head -n 3 image.ppm > imageHeader.txt # we need to keep the image header intact
tail -n +4 image.ppm > imageBody # image data we are manipulating

openssl enc -aes-128-ecb -nosalt -pass pass:"super secret" -in imageBody -out ecb

cat imageHeader.txt ecb > ecb.ppm

convert ecb.ppm out.png

rm ecb ecb.ppm imageBody imageHeader.txt image.ppm

