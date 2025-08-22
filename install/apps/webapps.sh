#!/bin/bash

if [ -z "$AUTARCHY_BARE" ]; then
  autarchy-webapp-install "ChatGPT" https://chatgpt.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/chatgpt.png
  autarchy-webapp-install "YouTube" https://youtube.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/youtube.png
  autarchy-webapp-install "GitHub" https://github.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/github-light.png
  autarchy-webapp-install "X" https://x.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/x-light.png
  autarchy-webapp-install "Discord" https://discord.com/channels/@me https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/discord.png
fi
