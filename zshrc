# Check if $XDG_CONFIG_HOME is set and not empty
if [[ -z "$XDG_CONFIG_HOME" ]]; then
#  echo "\$XDG_CONFIG_HOME is not set. Setting it to \$HOME/.config..."
  XDG_CONFIG_HOME="$HOME/.config"
elif [[ -z "${XDG_CONFIG_HOME// }" ]]; then
#  echo "\$XDG_CONFIG_HOME is empty. Setting it to \$HOME/.config..."
  XDG_CONFIG_HOME="$HOME/.config"
fi


[[ ! -f "${XDG_CONFIG_HOME}/config-repo/environment.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/environment.sh"


if command -v thefuck &>/dev/null; then
 eval $(thefuck --alias)
fi

[[ ! -f "${XDG_CONFIG_HOME}/config-repo/ohmyzsh.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/ohmyzsh.sh"
[[ ! -f "${XDG_CONFIG_HOME}/config-repo/aliases/my_aliases.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/aliases/my_aliases.sh"

[[ ! -f "${XDG_CONFIG_HOME}/config-repo/zoxide.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/zoxide.sh"

[[ ! -f "${XDG_CONFIG_HOME}/config-repo/functions.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/functions.sh"
