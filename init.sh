#!/bin/bash

getOS(){
    if [[ "$OSTYPE" =~ "darwin" ]]; then
        echo "mac"
    elif [[ "$OSTYPE" =~ "linux" ]]; then
        source /etc/os-release
        case $ID in
            debian|ubuntu)
                echo "ubuntu"
                ;;
            centos|"tencentos"|fedora|rhel)
                echo "centos"
                ;;
        esac
    else
        echo "Unspported OS"
    fi
}

install(){
    if [ $OS == "ubuntu" ]; then
        sudo apt-get install -y zsh ripgrep curl build-essential
    elif [ $OS == "centos" ]; then
        sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
        sudo yum install -y zsh ripgrep curl build-essential
    fi

    # require neovim >= 0.61
    if [ $OS == 'mac' ]; then
        # homebrew will install latest version
        brew install neovim ripgrep
    else
        # apt and yum may be old version
        curl -O -L "https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage"
        chmod +x nvim.appimage
        sudo mv ./nvim.appimage /usr/local/bin/nvim
    fi
}

zshInstall(){
    mkdir -p ~/.config/zsh
    export RUNZSH=no
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions

    cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
alias vim="nvim"
alias vi="nvim"
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export EDITOR=/usr/local/bin/nvim
EOF
}

neovimInstall(){
    # install vim-plug
    # sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    #  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # packer.vim
    # git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    #     ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # init neovim config
    ln -s ${HOME}/dotFiles/nvim ${HOME}/.config/nvim
}

function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

goInstall(){
    if [ $OS == "mac" ]; then
        brew install golang
    #elif [ $OS == "ubuntu" ]; then
    #    sudo apt-get install -y golang
    #elif [ $OS == "centos" ]; then
    #    sudo yum install -y golang
    else
        sudo rm -rf /usr/local/go && curl -L https://go.dev/dl/go1.18.linux-amd64.tar.gz | sudo tar -xz -C /usr/local
        export PATH=$PATH:/usr/local/go/bin
        echo "export PATH=\$PATH:/usr/local/go/bin" >> ${ZDOTDIR:-$HOME}/.zshrc
    fi

    mkdir -p ${HOME}/workspace/golang

    cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
export GOPATH=${HOME}/workspace/golang
export GOBIN=\${GOPATH}/bin
export PATH=\$PATH:\$GOBIN
export GO111MODULE=on
EOF

    # install gopls

    export GOPATH=${HOME}/workspace/golang 
    export GO111MODULE=on

    # compare go version
    goVersion=`go version | awk '{print $3}'`
    goVersion=${goVersion:2:${#goVersion}}
    if version_ge $goVersion '1.16.0'; then
        go install golang.org/x/tools/gopls@latest
    else
        go install golang.org/x/tools/gopls
    fi
}

OS=`getOS`
if [ $OS == "Unspported OS" ]; then
    echo "Unsupported OS"
    exit 1
fi
install
zshInstall
neovimInstall
goInstall

exec zsh -l
