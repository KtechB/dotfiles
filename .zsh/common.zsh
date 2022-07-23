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

# ================== path =========
path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)
if (( $+commands[sw_vers] )) && (( $+commands[arch] )); then
	[[ -x /usr/local/bin/brew ]] && alias brew="arch -arch x86_64 /usr/local/bin/brew"
	alias x64='exec arch -x86_64 /bin/zsh'
	alias a64='exec arch -arm64e /bin/zsh'
	switch-arch() {
		if  [[ "$(uname -m)" == arm64 ]]; then
			arch=x86_64
		elif [[ "$(uname -m)" == x86_64 ]]; then
			arch=arm64e
		fi
		exec arch -arch $arch /bin/zsh
	}
fi
setopt magic_equal_subst

export PATH=/Users/buchi_mac/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$HOME/.anyenv/bin:$PATH
export PATH=$HOME/nodenv/bin:$PATH
export PATH=/Users/buchi_mac/.nodenv/versions/14.16.0/lib/node_modules/@aws-amplify/cli/bin:$PATH
eval "$(nodenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/buchi_mac/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/buchi_mac/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/buchi_mac/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/buchi_mac/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
conda activate
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/buchi_mac/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/buchi_mac/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/buchi_mac/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/buchi_mac/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$PATH:/Library/Frameworks/Mono.framework/Commands"
# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi
export GOOGLE_APPLICATION_CREDENTIALS="/Users/buchi_mac/google-keys/kaggleml-299700-78959865d152.json"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$PATH:$(go env GOPATH)/bin"

# >>> CLI tools >>>
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
