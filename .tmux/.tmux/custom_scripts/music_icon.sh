#!/bin/bash
spotifycli --status 1> /dev/null 2> /dev/null
if [ $? -eq 0 ]; then
    echo 🎵
fi
