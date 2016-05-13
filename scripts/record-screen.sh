#!/bin/bash
taskset -c 0,1 avconv -video_size 1920x1080 \ 
-framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i default \
"$(date +%F-%H-%M-%S)_meeting.mkv" -y # record screen
