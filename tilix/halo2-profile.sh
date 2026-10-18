#!/usr/bin/env bash
# Adds a "Halo 2" Tilix profile with the Halo 2 main menu colors and makes it the default.
# Your other profiles are left alone. Running it again updates the same profile.
set -e

LIST=com.gexperts.Tilix.ProfilesList
NAME="Halo 2"

# Reuse the profile if this script made one before
uuid=""
for id in $(gsettings get $LIST list | tr -d "[],'"); do
  if [ "$(gsettings get com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/$id/ visible-name)" = "'$NAME'" ]; then
    uuid=$id
  fi
done
if [ -z "$uuid" ]; then
  uuid=$(cat /proc/sys/kernel/random/uuid)
  current=$(gsettings get $LIST list)
  case "$current" in
    *"'"*) gsettings set $LIST list "${current%]}, '$uuid']" ;;
    *) gsettings set $LIST list "['$uuid']" ;;
  esac
fi

P="com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/$uuid/"
gsettings set $P visible-name "$NAME"
gsettings set $P use-theme-colors false
gsettings set $P foreground-color '#c4ddf7'
gsettings set $P background-color '#060b16'
gsettings set $P palette "['#0b1424', '#c75a5f', '#5fb88f', '#d4b066', '#3f7fcc', '#8f7fd6', '#58c2dc', '#a9c4e2', '#33496b', '#e07a7f', '#82d6ad', '#ecca85', '#6fb3ff', '#b1a3f0', '#86def2', '#e6f3ff']"
gsettings set $P cursor-colors-set true
gsettings set $P cursor-foreground-color '#060b16'
gsettings set $P cursor-background-color '#7cc4ff'
gsettings set $P highlight-colors-set true
gsettings set $P highlight-foreground-color '#e6f3ff'
gsettings set $P highlight-background-color '#1d3d66'
gsettings set $P badge-color-set true
gsettings set $P badge-color '#5d7799'
gsettings set $P bold-color-set false
gsettings set $P background-transparency-percent 6

gsettings set $LIST default "$uuid"
gsettings set com.gexperts.Tilix.Settings theme-variant 'dark'
echo "Tilix profile '$NAME' is now the default ($uuid)"
