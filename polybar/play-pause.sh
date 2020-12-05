#!/bin/bash
VAR1="Playing"
VAR2=$(playerctl status -p playerctld)
if [ "$VAR2" = "$VAR1" ];
then
    echo " "
else
    echo " "
fi
