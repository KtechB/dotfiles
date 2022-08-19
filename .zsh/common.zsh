# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit

# git設定
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{yellow}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd(){ vcs_info }

RPROMPT='${vcs_info_msg_0_}'"$p_color"

PROMPT='
%*
%F{yellow}[%~]%f
%# '

alias gpo='git push origin HEAD'
alias gc-m='git commit -m'
alias tree='tree -a -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N'

 >>> CLI tools >>>
eval $(thefuck --alias)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
# <<< CLI tools <<<
export PATH="/usr/local/opt/llvm/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# >>> exa >>>

if [[ $(command -v exa) ]]; then
alias e='exa --icons --git'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons --git'
  alias la=ea
  alias ee='exa -aahl --icons --git'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
  alias l='clear && ls'
fi

# <<< exa <<<

export PATH="$HOME/.poetry/bin:$PATH"
