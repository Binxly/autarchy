echo "Adding Autarchy version info to fastfetch"
if ! grep -q "autarchy" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/autarchy/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

