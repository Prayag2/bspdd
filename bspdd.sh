#!/usr/bin/env bash
new_desktop_name=""

get_total() {
    echo $(bspc query -D | wc -l)
}
get_occupied() {
    echo $(bspc query -D -d ".occupied" | wc -l)
}

add_desktop() {
    echo "adding desktop"
    bspc monitor -a "$new_desktop_name"
}

remove_desktops() {
    echo "removing unoccupied desktops"
    total_desktops=$(get_total)
    occupied_desktops=$(get_occupied)

    while [[ $occupied_desktops -lt $((total_desktops-1)) ]]; do
        bspc desktop "any.!occupied" -r
        total_desktops=$(get_total)
        occupied_desktops=$(get_occupied)
    done
}

make_desktops(){
    total_desktops=$(get_total)
    occupied_desktops=$(get_occupied)

    if [[ $occupied_desktops -eq $total_desktops ]]; then
        add_desktop
    elif [[ $occupied_desktops -lt $((total_desktops-1)) ]]; then
        remove_desktops
    fi
}

make_desktops

bspc subscribe node_add node_remove node_transfer | while read -r line;
do
    printf "Total: $total_desktops\nOccupied: $occupied_desktops\n"
    make_desktops
done
