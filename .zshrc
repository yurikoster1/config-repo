# Check if $XDG_CONFIG_HOME is set and not empty
if [[ -z "$XDG_CONFIG_HOME" ]]; then
#  echo "\$XDG_CONFIG_HOME is not set. Setting it to \$HOME/.config..."
  XDG_CONFIG_HOME="$HOME/.config"
elif [[ -z "${XDG_CONFIG_HOME// }" ]]; then
#  echo "\$XDG_CONFIG_HOME is empty. Setting it to \$HOME/.config..."
  XDG_CONFIG_HOME="$HOME/.config"
fi



export PATH=$HOME/bin:/usr/local/bin:/var/lib/flatpak/exports/bin/:$PATH
export PATH="$HOME/.local/bin:$PATH"

eval $(thefuck --alias)

[[ ! -f "${XDG_CONFIG_HOME}/config-repo/ohmyzsh.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/ohmyzsh.sh"
