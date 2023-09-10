#!/bin/bash
# Check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}


# List traditional packages (APT/dpkg)
dpkg -l > installed_packages.txt

# List Snap packages if Snap is available
if command_exists snap; then
  snap list > installed_snaps.txt
else
  echo "Snap is not installed or not available."
fi

# List Flatpaks if Flatpak is available
if command_exists flatpak; then
  flatpak list > installed_flatpaks.txt
else
  echo "Flatpak is not installed or not available."
fi

# List Nix packages if Nix is available
if command_exists nix-env; then
  nix-env -q > installed_nix_packages.txt
else
  echo "Nix is not installed or not available."
fi

# List globally installed Python packages (pip) if pip is available
if command_exists pip; then
  pip list --format=freeze > installed_pip_packages.txt
else
  echo "pip is not installed or not available."
fi

# List globally installed Node.js packages (npm) if npm is available
if command_exists npm; then
  npm list -g --depth=0 > installed_npm_packages.txt
else
  echo "npm is not installed or not available."
fi

# Check if "am" is available and list managed AppImages
if command_exists am; then
  am -f > installed_am_packages.txt
else
  echo "am is not installed or not available."
fi

# Check if distrobox-list command exists
if command_exists distrobox-list; then
  # Get the list of containers and process each one
  distrobox-list | tail -n +2 | while IFS="|" read -r container_id name status mem cpu image; do
    # Check if the container is not in "Up" state and start it if needed
    if [ "$status" != " Up " ]; then
      docker start "$container_id"
    fi

   
    case "$image" in
      *archlinux*)
         docker exec "$container_id" pacman -Q > "installed_programs_archlinux_$container_id.txt"
        ;;
      *debian*)
        docker exec "$container_id" dpkg -l > "installed_programs_debian_$container_id.txt"
        ;;
      *fedora*)
        docker exec "$container_id" rpm -qa > "installed_programs_fedora_$container_id.txt"
        ;;
      *)
        echo "Unknown distro in $container_id: $distro_name"
        ;;
    esac
  done
else
  echo "Distrobox is not installed or not available."
fi

echo "Lists of installed software have been saved."