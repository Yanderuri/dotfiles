# Aliases
alias ls="eza";

# Environment variables
export WHICH_SHELL="zsh"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export EDITOR="nvim"
export HOMEBREW_EDITOR="nvim"
export ZSHRC="$HOME/.zshrc"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Shell enhancements
source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh
eval "$(starship init $WHICH_SHELL)"
eval "$(atuin init $WHICH_SHELL)" 
eval "$(fzf --$WHICH_SHELL)"
. "$HOME/.cargo/env"

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load
# Finally, autocomplete
autoload -Uz compinit
compinit
