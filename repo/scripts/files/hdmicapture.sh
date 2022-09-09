#!/bin/sh
mpv --profile=low-latency --untimed --demuxer-lavf-o-set=input_format=mjpeg $@
