#!/bin/bash
# This script is intended to be used with autorandr to switch display profiles when monitors are plugged in or unplugged.
# Associate this script with udev rules or similar to trigger it on monitor hotplug events, otherwise use i3 shortcuts.

set -e

LOCK="/tmp/dock-hotplug.lock"
exec 9>"$LOCK"
flock -n 9 || exit 0

# current profile
CURRENT=$(autorandr --current 2>/dev/null || echo "unknown")

# available profiles and automatic match
NEXT=$(autorandr --detected 2>/dev/null | head -n 1)

# fallback if autorandr does not detect
if [[ -z "$NEXT" ]]; then
    exit 0
fi

# avoid reapplying the same profile
if [[ "$CURRENT" == "$NEXT" ]]; then
    exit 0
fi

autorandr --change
