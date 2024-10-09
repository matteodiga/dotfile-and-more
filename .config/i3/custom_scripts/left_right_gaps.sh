#!/bin/bash

# $1 is the gaps size

# Set the left and right gaps for the currently focused window
i3-msg gaps left current set "$1"
i3-msg gaps right current set "$1"
