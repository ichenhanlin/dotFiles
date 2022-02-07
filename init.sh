#!/bin/sh

# Install neovim configuration
#mkdir ~/.config/nvim
ln -s ./nvim/ ~/.config/nvim
#cp ./nvim/coc-settings.json ~/.config/nvim

# Install for Golang
go get -u github.com/cweill/gotests/...

# Install LSP

# Install For telescope.nvim
brew install ripgrep

# Install Zsh Configuration
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
alias proxy="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891"
alias rproxy="export https_proxy=socks5://192.168.1.1:1080 http_proxy=socks5://192.168.1.1:1080 all_proxy=socks5://192.168.1.1:1080"
alias unproxy="unset http_proxy;unset https_proxy;unset all_proxy"
alias vim="nvim"
alias vi="nvim"
EOF

mkdir ~/.config/zsh
## Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
echo "source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

## Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
echo "source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

