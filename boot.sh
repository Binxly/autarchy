#!/bin/bash

ansi_art='
 █████╗ ██╗   ██╗████████╗ █████╗ ██████╗  ██████╗██╗  ██╗██╗   ██╗
██╔══██╗██║   ██║╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██║  ██║╚██╗ ██╔╝
███████║██║   ██║   ██║   ███████║██████╔╝██║     ███████║ ╚████╔╝
██╔══██║██║   ██║   ██║   ██╔══██║██╔══██╗██║     ██╔══██║  ╚██╔╝
██║  ██║╚██████╔╝   ██║   ██║  ██║██║  ██║╚██████╗██║  ██║   ██║
╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝'

clear
echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

# Use custom repo if specified, otherwise default to basecamp/autarchy
AUTARCHY_REPO="${AUTARCHY_REPO:-basecamp/autarchy}"

echo -e "\nCloning Autarchy from: https://github.com/${AUTARCHY_REPO}.git"
rm -rf ~/.local/share/autarchy/
git clone "https://github.com/${AUTARCHY_REPO}.git" ~/.local/share/autarchy >/dev/null

# Use custom branch if instructed
if [[ -n "$AUTARCHY_REF" ]]; then
  echo -e "\eUsing branch: $AUTARCHY_REF"
  cd ~/.local/share/autarchy
  git fetch origin "${AUTARCHY_REF}" && git checkout "${AUTARCHY_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/autarchy/install.sh
