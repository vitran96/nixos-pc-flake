# === zim ===
ZIM_CONFIG_FILE=~/.zimrc

ZIM_HOME=~/.zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://raw.githubusercontent.com/zimfw/zimfw/refs/tags/v1.18.0/zimfw.zsh
fi

# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

# =============

# Load .zshenv
if [[ -f ~/.zshenv ]]; then
  source ~/.zshenv
fi

# Load aliases
if [[ -f ~/.zsh_aliases ]]; then
  source ~/.zsh_aliases
fi

# Load hook
if [[ -f ~/.zsh_hook ]]; then
  source ~/.zsh_hook
fi