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
        sudo yum install -y zsh ripgrep curl util-linux-user
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
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.local/share/zsh/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh/zsh-autosuggestions

    cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
alias vim="nvim"
alias vi="nvim"
source \$HOME/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source \$HOME/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
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

version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

goInstall(){
    if [ $OS == "mac" ]; then
        brew install golang
    #elif [ $OS == "ubuntu" ]; then
    #    sudo apt-get install -y golang
    #elif [ $OS == "centos" ]; then
    #    sudo yum install -y golang
    else
        sudo rm -rf /usr/local/go && curl -L https://go.dev/dl/go1.18.linux-amd64.tar.gz | sudo tar -xz -C /usr/local
        echo "export PATH=\$PATH:/usr/local/go/bin" >> ${ZDOTDIR:-$HOME}/.zshrc
    fi

    mkdir -p ${HOME}/workspace/golang

    cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
export GOPATH=${HOME}/workspace/golang
export GOBIN=\${GOPATH}/bin
export PATH=\$PATH:\$GOBIN
export GO111MODULE=on
EOF

    # # install gopls

    # export GOPATH=${HOME}/workspace/golang 
    # export GO111MODULE=on

    # # compare go version
    # goVersion=`go version | awk '{print $3}'`
    # goVersion=${goVersion:2:${#goVersion}}
    # if version_ge $goVersion '1.16.0'; then
    #     go install golang.org/x/tools/gopls@latest
    # else
    #     go install golang.org/x/tools/gopls
    # fi
}

javaInstall(){
    sudo mkdir /usr/local/java/
    if [ $OS == "mac" ]; then
        brew install openjdk@8 openjdk@11
	sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
	sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
	sudo ln -sfn /usr/local/opt/openjdk@11 /usr/local/java/java-11
	sudo ln -sfn /usr/local/opt/openjdk@8 /usr/local/java/java-8
    elif [ $OS == "ubuntu" ]; then
        sudo apt-get install -y openjdk-8-jdk openjdk-11-jdk
        # switch to jdk-8 default
        sudo update-alternatives --config java
        sudo update-alternatives --config javac
        
        sudo ln -s /usr/lib/jvm/java-8-openjdk-amd64 /usr/local/java/java-8 
        sudo ln -s /usr/lib/jvm/java-11-openjdk-amd64 /usr/local/java/java-11 
    elif [ $OS == "centos" ]; then
        sudo yum install -y java-1.8.0-openjdk-devel java-11-openjdk-devel
        # switch to jdk-8 default
        sudo update-alternatives --config java
        sudo update-alternatives --config javac
        
        sudo ln -s /usr/lib/jvm/java-1.8.0-openjdk-* /usr/local/java/java-8 
        sudo ln -s /usr/lib/jvm/java-11-openjdk-* /usr/local/java/java-11 
    fi

    mkdir -p $HOME/.local/share/jdtls
    curl -L https://download.eclipse.org/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz | tar -xz -C ${HOME}/.local/share/jdtls

    cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
export JAVA_HOME8=/usr/local/java/java-8
export JAVA_HOME11=/usr/local/java/java-11
export JAVA_HOME=\$JAVA_HOME8
export PATH=\$PATH:\$HOME/.local/share/jdtls/bin:\$JAVA_HOME/bin
EOF

}
pythonInstall(){
    if [ $OS == "mac" ]; then
        brew install python3 python3-pip
    elif [ $OS == "ubuntu" ]; then
        sudo apt install -y python3 python3-pip python3-dev
    elif [ $OS == "centos" ]; then
        sudo yum install -y python3 python3-pip python3-devel
    fi
    pip3 install 'python-lsp-server[all]'
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
javaInstall
pythonInstall

exec zsh -l
