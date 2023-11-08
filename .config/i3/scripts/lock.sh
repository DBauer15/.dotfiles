# Lock screen to color
#i3lock -i /home/davidbau/Pictures/Wallpapers/wallhaven-jx1gxy.png # -c 2f2e42
i3lock -c 2f2e42

# If still locked after a mninute, turn off screen
sleep 10 && pgrep i3lock && xset dpms force off
