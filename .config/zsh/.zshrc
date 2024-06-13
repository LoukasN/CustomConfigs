# History settings
HISTFILE=~/.histfile
HISTDUP=erase
HISTSIZE=5000
SAVEHIST=5000

# Options
setopt autocd
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybinds
bindkey -e
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

# The following lines were added by compinstall
zstyle :compinstall filename '/home/loukas/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Sourcing aliases and plugin "manager"
source ~/.aliases
source ~/.config/zsh/zsh-functions

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

# Jump
eval "$(zoxide init --cmd cd zsh)"

# Fzf
eval "$(fzf --zsh)"

# Starship
eval "$(starship init zsh)"
