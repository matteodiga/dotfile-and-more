#!/bin/bash
ram=$(free -h -m | awk 'NR==2{print $3 "/" $2}' | sed "s/i/B/" | sed "s/i/B/")

echo "$ram"
