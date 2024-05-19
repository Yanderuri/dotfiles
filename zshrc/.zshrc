# Environment variables
export WHICH_SHELL="zsh"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export EDITOR="nvim"
export HOMEBREW_EDITOR="nvim"
export ZSHRC="$HOME/.zshrc"
. /opt/homebrew/opt/asdf/libexec/asdf.sh
alias ls="eza";
# Shell enhancements
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load
source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh
eval "$(starship init $WHICH_SHELL)"
eval "$(atuin init zsh)" 
eval "$(fzf --zsh)"
. "$HOME/.cargo/env"
# # Finally, autocomplete
# autoload -Uz compinit
# compinit
# fastfetch
