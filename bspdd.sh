#!/usr/bin/env bash

# Variables
new_desktop_name=""
monitor_sel=""
help_text="Usage: bspdd.sh [options]\
	\nbspdd.sh is a script that brings i3wm like dynamic desktop functionality to bspwm.\
    \nOptions: \
    \n\t-n <name of new desktops>\n\t\tcreate new desktops with this name (default is  from nerd fonts)\
    \n\t-m <MONITOR_SEL>\n\t\tuse a specific monitor (see bspc(1) for more info)\n"

# Parse Arguments
while getopts "n:m:h" opt; do
    case $opt in
        n)
            new_desktop_name=$OPTARG ;;
        m)
            monitor_sel=$OPTARG ;;
        h|\?)
            printf "$help_text"
            exit 1 ;;
    esac
done

# FUNCTIONS
get_total() {
    echo $(bspc query -D -m "$1" | wc -l)
}

get_occupied() {
    echo $(bspc query -D -d ".occupied" -m "$1" | wc -l)
}

add_desktop() {
    echo "Adding desktop"
    bspc monitor "$1" -a "$new_desktop_name"
}

remove_desktops() {
    echo "Removing unoccupied desktops"
    bspc query -D -d ".!occupied" -m "$1" | sed '$d' | while read desktopID; do
      bspc desktop "$desktopID" -r
    done
}

manage_desktops(){
    if [[ -z $monitor_sel ]]; then
	monitors=$(bspc query -M)
    else
	monitors=$(bspc query -M -m "$monitor_sel")
    fi
    
    echo "$monitors" | while read monitor; do
	total_desktops=$(get_total "$monitor")
	occupied_desktops=$(get_occupied "$monitor")
	printf "Monitor: %s\nTotal: %s\nOccupied: %s\n" $monitor $total_desktops $occupied_desktops
	echo "---"

	if [[ $occupied_desktops -eq $total_desktops ]]; then
	    add_desktop "$monitor"
	elif [[ $occupied_desktops -lt $((total_desktops-1)) ]]; then
	    remove_desktops "$monitor"
	fi
    done;
}

manage_desktops
bspc subscribe node_add node_remove node_transfer | while read -r line;
do
    manage_desktops
done
