echo "Update Waybar CSS to dim unused workspaces"

if ! grep -q "#workspaces button\.empty" ~/.config/waybar/style.css; then
  autarchy-refresh-config waybar/style.css
  autarchy-restart-waybar
fi
