#!/bin/bash

# Function to download and install fonts
install_font() {
  local font_name=$1
  local font_url=$2
  local install_dir="/usr/share/fonts/truetype/$font_name"

  echo "Installing $font_name..."
  sudo mkdir -p "$install_dir"
  sudo wget -q --show-progress -O "$install_dir/$font_name.ttf" "$font_url"
  sudo chmod 644 "$install_dir/$font_name.ttf"
  sudo fc-cache -f -v
  echo "Done installing $font_name."
  echo
}

# Define font names and URLs
fonts=(
  "Hack Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip"
  "Iosevka Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip"
  "mononoki Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip"
  "TerminessTTFNerdFontMono|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Terminus.zip"
  "JetBrains Mono|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip"
  "MesloLGS NF|https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF.zip"
)

# Loop through the fonts and install them
for font in "${fonts[@]}"; do
  font_name="${font%%|*}"
  font_url="${font#*|}"
  install_font "$font_name" "$font_url"
done
