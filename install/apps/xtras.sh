#!/bin/bash

if [ -z "$AUTARCHY_BARE" ]; then
  yay -S --noconfirm --needed \
    gnome-calculator gnome-keyring signal-desktop \
    obsidian-bin libreoffice obs-studio kdenlive \
    xournalpp localsend-bin

  # Packages known to be flaky or having key signing issues are run one-by-one
  for pkg in pinta typora spotify; do
    yay -S --noconfirm --needed "$pkg" ||
      echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
  done

  yay -S --noconfirm --needed bitwarden bitwarden-cli ||
    echo -e "\e[31mFailed to install bitwarden. Continuing without!\e[0m"
fi

# Copy over Autarchy applications
source autarchy-refresh-applications || true
