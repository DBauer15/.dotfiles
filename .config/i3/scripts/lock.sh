# Lock screen to color
#i3lock -c 3b4252
i3lock -i ~/Pictures/lock_blur.png

# If still locked after a mninute, turn off screen
sleep 10 && pgrep i3lock && xset dpms force off
