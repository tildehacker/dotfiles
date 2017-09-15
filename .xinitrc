# Reload .Xresources on 20160624
xrdb -load .Xresources

# Run unclutter on X startup on 20160624
unclutter &

# Add multimonitor support on 20161111
xrandr --dpi 144 --output eDP1 --auto --primary --output VGA1 --auto --right-of eDP1

# Run i3 on X startup on 20160624
exec i3
