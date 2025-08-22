echo "Add UWSM env"

export AUTARCHY_PATH="$HOME/.local/share/autarchy"
export PATH="$AUTARCHY_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
autarchy-refresh-config uwsm/env

echo -e "\n\e[31mAutarchy bins have been added to PATH (and AUTARCHY_PATH is now system-wide).\nYou must immediately relaunch Hyprland or most Autarchy cmds won't work.\nPlease run Autarchy > Update again after the quick relaunch is complete.\e[0m"
echo

gum confirm "Ready to relaunch Hyprland? (All applications will be closed)" &&
  touch ~/.local/state/autarchy/migrations/1751134560.sh &&
  uwsm stop
