# gets read 2nd, use for actually setting up zsh
export PATH=~/.local/bin/:$PATH

eval "$(zoxide init zsh)"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

source $HOME/.oh-my-zsh/oh-my-zsh.sh

[ -f "$ZDOTDIR/alias.zsh" ] && source "$ZDOTDIR/alias.zsh"

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
source "$HOME/.local/install/fzf-tab-completion/zsh/fzf-zsh-completion.sh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit light joshskidmore/zsh-fzf-history-search

ZSH_AUTOSUGGEST_STRATEGY=(completion)

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

autoload -U compinit && compinit

HISTSIZE=5000
HISTFILE=$ZDOTDIR/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# better history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
bindkey '^I' fzf_completion
zstyle ':completion:*' fzf-search-display true

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
