# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
alias ls="eza"

# Environment variables
export WHICH_SHELL="zsh"
export EDITOR=nvim
export QSYS_ROOTDIR="/home/vy-faye/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/23.1/quartus/sopc_builder/bin"

# Shell enhancements
eval "$(atuin init zsh)"
eval "$(fzf --zsh)"

. /opt/asdf-vm/asdf.sh
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
