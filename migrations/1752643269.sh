echo "Add new matte black theme"

if [[ ! -L "~/.config/autarchy/themes/matte-black" ]]; then
  ln -snf ~/.local/share/autarchy/themes/matte-black ~/.config/autarchy/themes/
fi
