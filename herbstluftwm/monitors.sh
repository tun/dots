#!/bin/bash

hc() {
    herbstclient "$@"
}

hc spawn killall polybar
for monitor in $(xrandr --listmonitors | grep -v Monitors | wc -l) ; do
    # start it on each monitor
    case $monitor in
    	1)
			hc set_monitors 1920x1080+1280+0+0
    		hc pad 0 35 0 35 0
			hc spawn polybar -r main
			hc spawn polybar -r top
    		;;

    	2)
			hc spawn xrandr --auto --output HDMI1 --mode 1920x1080 --left-of eDP1 
			hc set_monitors 1920x1080+0 1920x1080+1280+0+0
    		hc pad 0 0 0 0 0
    		hc pad 1 35 0 35 0
			hc spawn polybar -r top
			hc spawn polybar -r main
    		;;
    esac

done

hc detect_monitors

