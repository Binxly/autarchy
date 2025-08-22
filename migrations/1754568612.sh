echo "Update Waybar config to fix path issue with update-available icon click"

if grep -q "alacritty --class Autarchy --title Autarchy -e autarchy-update" ~/.config/waybar/config.jsonc; then
  sed -i 's|\("on-click": "alacritty --class Autarchy --title Autarchy -e \)autarchy-update"|\1autarchy-update"|' ~/.config/waybar/config.jsonc
  autarchy-restart-waybar
fi
