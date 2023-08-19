# Check if $XDG_CONFIG_HOME is set and not empty
if [[ -z "$XDG_CONFIG_HOME" ]]; then
#  echo "\$XDG_CONFIG_HOME is not set. Setting it to \$HOME/.config..."
  XDG_CONFIG_HOME="$HOME/.config"
elif [[ -z "${XDG_CONFIG_HOME// }" ]]; then
#  echo "\$XDG_CONFIG_HOME is empty. Setting it to \$HOME/.config..."
  XDG_CONFIG_HOME="$HOME/.config"
fi


[[ ! -f "${XDG_CONFIG_HOME}/config-repo/environment.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/environment.sh"

# Check and add directories to PATH if they exist and are not already in PATH
if [ -d "$HOME/bin" ] && ! case ":$PATH:" in *":$HOME/bin:"*) true;; *) false;; esac; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "/usr/local/bin" ] && ! case ":$PATH:" in *":/usr/local/bin:"*) true;; *) false;; esac; then
    export PATH="/usr/local/bin:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] && ! case ":$PATH:" in *":/var/lib/flatpak/exports/bin/:"*) true;; *) false;; esac; then
    export PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

if [ -d "$HOME/.local/bin" ] && ! case ":$PATH:" in *":$HOME/.local/bin:"*) true;; *) false;; esac; then
    export PATH="$HOME/.local/bin:$PATH"
fi


if command -v thefuck &>/dev/null; then
 eval $(thefuck --alias)
fi

[[ ! -f "${XDG_CONFIG_HOME}/config-repo/ohmyzsh.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/ohmyzsh.sh"
[[ ! -f "${XDG_CONFIG_HOME}/config-repo/aliases/my_aliases.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/aliases/my_aliases.sh"

[[ ! -f "${XDG_CONFIG_HOME}/config-repo/zoxide.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/zoxide.sh"

[[ ! -f "${XDG_CONFIG_HOME}/config-repo/functions.sh" ]] || source "${XDG_CONFIG_HOME}/config-repo/functions.sh"
