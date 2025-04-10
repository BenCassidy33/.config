Mullvad=/opt/'Mullvad VPN'/mullvad-gui

if [ -n "$(pidof "$Mullvad")" ]; then
    pkill mullvad-gui
else
    "$Mullvad"
fi
