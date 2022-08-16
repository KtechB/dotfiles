set -eu
cd `dirname $0`

brew install tmux

ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf

touch ~/.tmux.conf
echo 'source ~/dotfile/tmux.conf'>> ~/.tmux.conf
