#!/bin/bash

autarchy_migrations_state_path=~/.local/state/autarchy/migrations
mkdir -p $autarchy_migrations_state_path

for file in ~/.local/share/autarchy/migrations/*.sh; do
  touch "$autarchy_migrations_state_path/$(basename "$file")"
done
