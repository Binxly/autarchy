if [[ ! -f ~/.local/state/autarchy/bare.mode ]]; then
  echo "Add missing installation of Zoom"

  if ! command -v zoom &>/dev/null; then
    yay -S --noconfirm --needed zoom
  fi
fi
