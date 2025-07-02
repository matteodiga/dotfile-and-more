#!/bin/sh

# Script Name: foo.sh
#
# Description:
#   This is a generic shell script to perform ...
#
# Usage:
#   This script is intended to be run either manually or as part of a scheduled job or as you prefer.
#
# Notes:
#   - this is a note

#---------------------------- FUNCTIONS ----------------------------#

# print usage
usage() {
    cat << _EOU

Usage:
    $0 [commands] [-h] [-c variable_c] -i interface [-v]

    This script performs a ...

    Command:
        command1
            perform the action ...

    Arguments:
        -c
            set c to variable_c

            Type: integer
            Maximum: 100
            Minimum: 1
        -i
            specify interface
        -v
            enable verbose mode
        -h
            print usage

    Environment variables:
        VAR1
            Variable 1 used to have ...

            Default: xyz
            Maxium: 10
            Minimum: 10

    Examples

    Exit codes:
        0: Success
        1: General error
        2: ...

_EOU
}

# support function to execute
simple_function () {
    echo "foo"
}

# this function perform ...
#
# params:
#   $1 -> time
#   $2 -> string
#
# returns 0 on success, 1 on failure
complete_function() {
    echo "I: starting function"
    # ...
}

#---------------------------- MAIN ----------------------------#

FOO="variable"

# check parameters number (needed if minimum number)
if [ $# -ne "0" ]; then
    echo "I: this script does not take arguments, check the usage. Quit."
    exit 1
fi

# set default values if not provided by environment and validate
LOG_VAR1="${VAR1:-xyz}"

if [ "$LOG_VAR1" -lt 10 ]; then
    echo "E: invalid value for VAR1, check the usage. Quit."
    exit 1
fi

# switch case to modify behavior base on environments variable
case "$VAR1" in
    test*)
        # ...
        ;;
    production)
        # ...
        ;;
    *)
        # fallback value
        ;;
esac

# parse and validate arguments
VERBOSE=0
while getopts "i:c:vh" OPT; do
    case $OPT in
        i)
            echo "arg is $OPTARG"
            INTERFACE="$OPTARG"
            ;;
        c)
            C=$OPT
            ;;
        v)
            VERBOSE=1
            ;;
        h)
            usage
            ;;
        *)
            echo "Invalid option: $OPT"
            usage
            exit 1
            ;;
    esac
done

if [ -z "$INTERFACE" ] ; then
    echo "E: provide a value for '-i' interface option, check the usage. Quit."
    exit 1
fi

simple_function
complete_function

echo "I: done"
exit 0
