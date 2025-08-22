#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

export PATH="$HOME/.local/share/autarchy/bin:$PATH"
AUTARCHY_INSTALL=~/.local/share/autarchy/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mAutarchy installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/autarchy/install.sh"
}

trap catch_errors ERR

show_logo() {
  clear
  cat <~/.local/share/autarchy/logo.txt
  echo
}

show_subtext() {
  echo "$1" # | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

# Install prerequisites
source $AUTARCHY_INSTALL/preflight/guard.sh
source $AUTARCHY_INSTALL/preflight/aur.sh
source $AUTARCHY_INSTALL/preflight/presentation.sh
source $AUTARCHY_INSTALL/preflight/migrations.sh

# Configuration
show_logo beams 240
show_subtext "Let's install Autarchy! [1/5]"
source $AUTARCHY_INSTALL/config/identification.sh
source $AUTARCHY_INSTALL/config/config.sh
source $AUTARCHY_INSTALL/config/detect-keyboard-layout.sh
source $AUTARCHY_INSTALL/config/fix-fkeys.sh
source $AUTARCHY_INSTALL/config/network.sh
source $AUTARCHY_INSTALL/config/power.sh
source $AUTARCHY_INSTALL/config/timezones.sh
source $AUTARCHY_INSTALL/config/login.sh
source $AUTARCHY_INSTALL/config/nvidia.sh

# Development
show_logo decrypt 920
show_subtext "Installing terminal tools [2/5]"
source $AUTARCHY_INSTALL/development/terminal.sh
source $AUTARCHY_INSTALL/development/development.sh
source $AUTARCHY_INSTALL/development/nvim.sh
source $AUTARCHY_INSTALL/development/docker.sh
source $AUTARCHY_INSTALL/development/firewall.sh

# Desktop
show_logo slice 60
show_subtext "Installing desktop tools [3/5]"
source $AUTARCHY_INSTALL/desktop/desktop.sh
source $AUTARCHY_INSTALL/desktop/hyprlandia.sh
source $AUTARCHY_INSTALL/desktop/theme.sh
source $AUTARCHY_INSTALL/desktop/bluetooth.sh
source $AUTARCHY_INSTALL/desktop/asdcontrol.sh
source $AUTARCHY_INSTALL/desktop/fonts.sh
source $AUTARCHY_INSTALL/desktop/printer.sh

# Apps
show_logo expand
show_subtext "Installing default applications [4/5]"
source $AUTARCHY_INSTALL/apps/webapps.sh
source $AUTARCHY_INSTALL/apps/xtras.sh
source $AUTARCHY_INSTALL/apps/mimetypes.sh

# Updates
show_logo highlight
show_subtext "Updating system packages [5/5]"
sudo updatedb
yay -Syu --noconfirm --ignore uwsm

# Reboot
show_logo laseretch 920
show_subtext "You're done! So we'll be rebooting now..."
sleep 2
reboot
