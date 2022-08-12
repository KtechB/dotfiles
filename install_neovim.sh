cd `dirname $0`
brew install neovim --HEAD

# install packer.nvim https://github.com/wbthomason/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# dotfile
mkdir -p $HOME/.config/nvim

ln -sf ./neovim/.config/nvim/ $HOME/.config/nvim
# lua



