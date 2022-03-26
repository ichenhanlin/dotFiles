#!/bin/sh

OS="ubuntu"

getOS(){

    if [[ "$OSTYPE" =~ "darwin" ]]; then
        echo "mac"
    elif [[ "$OSTYPE" =~ "linux" ]]; then
        source /etc/os-relase
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

zhsInstall(){
    # install Neovim
    if [ $OS == "ubuntu" ]; then
        sudo apt-get install -y zsh
    elif [ $OS == "centos" ]; then
        sudo yum install -y zsh
    fi

    mkdir -p ~/.config/zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
    wait

    cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
        alias vim="nvim"
        alias vi="nvim"
        source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
EOF
    
    echo "Install zsh and Oh My Zsh done!"
}

neovimInstall(){
    # install Neovim
    if [ $OS == "mac" ]; then
        brew install neovim
        brew install ripgrep
    elif [ $OS == "ubuntu" ]; then
        sudo apt-get install -y ripgrep neovim
    elif [ $OS == "centos" ]; then
        sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
        sudo yum install -y ripgrep neovim
    fi

    # install vim-plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


    # init neovim config
    ln -s ${HOME}/dotFiles/nvim ${HOME}/.config/nvim
    echo "Install Neovim done!"
}

goInstall(){
    if [ $OS == "mac" ]; then
        brew install golang
    elif [ $OS == "ubuntu" ]; then
        sudo apt-get install -y golang
    elif [ $OS == "centos" ]; then
        sudo yum install -y golang
    fi

    mkdir -p ${HOME}/workspace/golang

    cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
        export GOPATH=${HOME}/workspace/golang
        export GOBIN=${GOPATH}/bin
        export PATH=$PATH:$GOBIN
EOF

    // install gopls
    go get golang.org/x/tools/gopls
}
OS=`getOS`
if [ $OS == "Unspported OS" ]; then
    echo "Unsupported OS"
    exit 1
fi
zhsInstall
neovimInstall
goInstall
