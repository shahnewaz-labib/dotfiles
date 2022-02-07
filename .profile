TOUCHPAD=$(xinput list | grep -i touchpad | sed -n 's:.*id=\([0-9]\+\).*:\1:p')

if [ -n ${TOUCHPAD} ]; then
    xinput set-prop ${TOUCHPAD} "libinput Tapping Enabled" 1
    xinput set-prop ${TOUCHPAD} "libinput Natural Scrolling Enabled" 1 
fi
