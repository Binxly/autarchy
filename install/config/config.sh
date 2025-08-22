#!/bin/bash

# Copy over configs
cp -R ~/.local/share/autarchy/config/* ~/.config/

# Use default bashrc from Autarchy
cp ~/.local/share/autarchy/default/bashrc ~/.bashrc

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# If bare install, allow a way for its exclusions to not get added in updates
if [ -n "$AUTARCHY_BARE" ]; then
  mkdir -p ~/.local/state/autarchy
  touch ~/.local/state/autarchy/bare.mode
fi

# Setup GPG configuration with multiple keyservers for better reliability
sudo mkdir -p /etc/gnupg
sudo cp ~/.local/share/autarchy/default/gpg/dirmngr.conf /etc/gnupg/
sudo chmod 644 /etc/gnupg/dirmngr.conf
sudo gpgconf --kill dirmngr || true
sudo gpgconf --launch dirmngr || true

# Increase lockout limit to 10 and decrease timeout to 2 minutes
sudo sed -i 's|^\(auth\s\+required\s\+pam_faillock.so\)\s\+preauth.*$|\1 preauth silent deny=10 unlock_time=120|' "/etc/pam.d/system-auth"
sudo sed -i 's|^\(auth\s\+\[default=die\]\s\+pam_faillock.so\)\s\+authfail.*$|\1 authfail deny=10 unlock_time=120|' "/etc/pam.d/system-auth"

# Set Cloudflare as primary DNS (with Google as backup)
sudo cp ~/.local/share/autarchy/default/systemd/resolved.conf /etc/systemd/

# Solve common flakiness with SSH
echo "net.ipv4.tcp_mtu_probing=1" | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true
git config --global init.defaultBranch master

# Set identification from install inputs
if [[ -n "${AUTARCHY_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$AUTARCHY_USER_NAME"
fi

if [[ -n "${AUTARCHY_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$AUTARCHY_USER_EMAIL"
fi

# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/autarchy/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$AUTARCHY_USER_NAME"
<Multi_key> <space> <e> : "$AUTARCHY_USER_EMAIL"
EOF
