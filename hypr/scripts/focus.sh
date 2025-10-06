#!/bin/bash

STATUS=$(hyprctl getoption animations:enabled | grep "int: " | awk '{print $2}')

ROUNDING=8
BORDER_SIZE=2
GAPS_IN=6
GAPS_OUT=6

if [ "$STATUS" = "1" ]; then
    hyprctl keyword animations:enabled 0
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword decoration:rouding 0 
    hyprctl keyword general:border_size 0

    pkill waybar
else
    hyprctl keyword animations:enabled 1
    hyprctl keyword general:gaps_in "$GAPS_IN"
    hyprctl keyword general:gaps_out "$GAPS_OUT"
    hyprctl keyword decoration:rounding "$ROUNDING"
    hyprctl keyword general:border_size "$BORDER_SIZE"

    hyprctl dispatch exec waybar
fi
