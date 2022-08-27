alias checkaliasload="echo ok"
alias startyabai="brew services start skhd;brew services start yabai"
alias stopyabai="brew services stop skhd;brew services stop yabai"
alias s_work="open -n /Applications/Google\ Chrome.app &&code&&open /Applications/Notion.app"

alias vi='nvim'

alias gpo='git push origin HEAD'
alias gc-m='git commit -m'
alias tree='tree -a -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N'


function gadd() {
    local selected
    selected=$(git status -s | fzf | awk '{print $2}')
    if [[ -n "$selected" ]]; then
        git add $selected
    fi
}


