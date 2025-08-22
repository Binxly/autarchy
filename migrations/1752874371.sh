echo "Add Catppuccin Latte light theme"
if [[ ! -L "~/.config/autarchy/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/autarchy/themes/catppuccin-latte ~/.config/autarchy/themes/
fi
