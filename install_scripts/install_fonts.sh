#!/bin/bash

DIRINIT=$(pwd);
# Function to download and install fonts
install_font() {
  local font_name=$1
  local font_url=$2
  local install_dir="/usr/share/fonts/truetype/$font_name"


  # Check if the font is already installed
  if fc-list | grep -q "$font_name"; then
    echo "$font_name is already installed. Skipping..."
    return
  fi

  echo "Installing $font_name..."
  sudo mkdir -p "$install_dir"
  sudo wget -q --show-progress -O "$install_dir/$font_name.zip" "$font_url"
  cd "$install_dir/"
  sudo unzip *.zip
  sudo rm *Windows*.ttf
  sudo rm *.zip
  sudo chmod 644 *.ttf
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
  "Fira Code Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip"
  "DejaVu Sans Mono Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip"
  "RobotoMono Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip"
  "Source Code Pro Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip"
  "UbuntuMono Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip"
  "PowerlineSymbols Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/PowerlineSymbols.zip"
  "DroidSansMono Nerd Font|https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip"
)
# Loop through the fonts and install them
for font in "${fonts[@]}"; do
  font_name="${font%%|*}"
  font_url="${font#*|}"
  install_font "$font_name" "$font_url"
done
