### Natural scrolling touchpad and mouse
Edit ```/usr/share/X11/xorg.conf.d/40-libinput.conf``` <br>
For touchpad: <br>
Find the line where it says ```Identifier "libinput touchpad catchall"``` and add the line ```Option "NaturalScrolling" "True"```<br>
For mouse, add this section:
```
# Match on all types of devices but joysticks
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
```
