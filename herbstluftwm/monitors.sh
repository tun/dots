#!/bin/bash

hc unlock

hc spawn polybar main

hc detect_monitors

for monitor in $(xrandr --listmonitors | grep -v Monitors | wc -l) ; do
    # start it on each monitor
    case $monitor in
        1)
            hc set_monitors 1920x1080+1280+0+0
            case "$XDG_SESSION_DESKTOP" in
                xfce )
                    hc pad 0 50 100 50 100
                    ;;
                herbstluftwm )
                    hc pad 0 50 100 50 100
                    ;;
            esac
            ;;

        2)
            hc spawn xrandr --auto --output HDMI1 --mode 1920x1080 --left-of eDP1
            hc set_monitors 1920x1080+0 1920x1080+1280+0+0
            hc pad 0 0 0 0 0
            hc pad 1 20 0 20 0
            ;;
    esac

done
