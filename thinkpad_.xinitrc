# Mouse sensitivity
# the value at the end is the sensitivity
# higher = more sensitive
# default 1.0
xinput --set-prop 11 "Coordinate Transformation Matrix" <xscale> 0 0 0 <yscale> 0 0 0 2.9

# Trackpoint sensitivity
# value at the end is the sensitivity
# higher = more sensitive
# default 1.0
xinput --set-prop "<your_trackpoint_name>" "Coordinate Transformation Matrix" <xscale> 0 0 0 <yscale> 0 0 0 2.9

fec --bg-scale ~/Wallpapers/
exec i3
flameshot &
