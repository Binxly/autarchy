echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/autarchy/themes/ristretto ]]; then
  ln -nfs ~/.local/share/autarchy/themes/ristretto ~/.config/autarchy/themes/
fi
