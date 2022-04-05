# dotFiles
个人用配置文件，包括neovim、zsh和tmux等

# 安装
## 自动安装
自动安装支持macos（需安装homebrew）、ubuntu、centos等
```
bash init.sh
```

## 手动安装
### 1. 安装依赖
需要以下依赖：

- neovim >= 0.6.1
- zsh
- curl

Ps: 

1. ubuntu和centos自带的包管理工具的neovim版本过低，需要手动下载已经编译好的二进制包，详情见[Neovim](https://github.com/neovim/neovim)。

### 2. 配置zsh

1. 安装[oh My Zsh](https://ohmyz.sh/)

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. 安装zsh高亮插件[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.local/share/zsh/zsh-syntax-highlighting
```

3. 安装[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
```
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh/zsh-autosuggestions
```

4. 配置**.zshrc**
```
cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
alias vim="nvim"
alias vi="nvim"
source \$HOME/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source \$HOME/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
EOF
```

### 3. 配置neovim

链接配置文件，首次打开neovim会自动下载packer.nvim并下载插件。
```
ln -s {Path to dotFiles}/dotFiles/nvim ${HOME}/.config/nvim
```

### 4. 配置golang
因为vim-go插件的缘故，要求golang版本大于等于1.16，然后配置环境变量即可，lsp、代码检查等工具会由vim-go自动下载。
```
mkdir -p ${HOME}/workspace/golang
cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
export GOPATH=${HOME}/workspace/golang
export GOBIN=\${GOPATH}/bin
export PATH=\$PATH:\$GOBIN
export GO111MODULE=on
EOF
```

### 5. 配置java

java由jdtls提供lsp功能，主要由nvim-jdtls插件连接lsp，因为jdtls要求JavaSE-11，而日常使用项目需要JavaSE-1.8，所以需要安装两个版本的java。

1. 下载jdtls
```
sudo mkdir -p $HOME/.local/share/jdtls
curl -L https://download.eclipse.org/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz | sudo tar -xz -C ${HOME}/.local/share/jdtls
```
2. 配置java
```
sudo mkdir /usr/local/java/
sudo ln -s {Path to jdk8} /usr/local/java/java-8 
sudo ln -s {Path to jdk11} /usr/local/java/java-11 

cat >> ${ZDOTDIR:-$HOME}/.zshrc<<EOF
export JAVA_HOME8=/usr/local/java/java-8
export JAVA_HOME11=/usr/local/java/java-11
export JAVA_HOME=JAVA_HOME8
export PATH=\$PATH:\$HOME/.local/share/jdtls/bin
EOF
```

### 6. 配置python3

# neovim插件说明

- 插件管理

[packer.nvim]()

- 状态栏

[lualine.nvom]()

[nvim-web-devicons]()

- 缩进

[indent-blankline.nvim]()

- LSP基本支持

[nvim-lspconfig]()

- 补全支持

[cmp-nvim-lsp]()

[cmp-buffer]()

[cmp-path]()

[cmp-cmdline]()

[nvim-cmp]()

[lspkind-nvim]()
- 代码片段支持

[LuaSnip]()

[cmp\_luasnip]()

[friendly-snippets]()

- Golang相关

基本命令、自动化: [vim-go]()

单元测试: [gotests-vim]()

- Java相关

[nvim-jdtls]()

- 文件、文本检索

[plenary.nvim]()

[telescope.nvim]()

[telescope-fzf-native.nvim]()

- 语法渲染

[nvim-treesitter]()

- 其他插件

[symbols-outline.nvim]()

[undotree]()

# neovim快捷键说明

## 普通设置

**\<Alt-h/j/k/l\>**: 切换窗口

**:Sw**: 强制保存

## LSP相关
**\<leader-gsh\>**: 显示函数签名

**\<leader-ca\>**: code action

**\<leader-gh\>**: hover

**\<leader-ge\>**: 错误浮窗

**\<leader-gd\>**: 显示定义

**\<leader-gi\>**: 显示实现

**\<leader-grs\>**: 显示引用（usage）

**:Rename**: 重命名

**\<leader-co\>**: 打开quickfix

**\<leader-cc\>**: 关闭quickfix

**\<leader-cn\>**: quickifx下一项

**\<leader-cp\>**: quickfix上一项

**\<leader-lo\>**: 打开locallist

**\<leader-lc\>**: 关闭locallist

**\<leader-ln\>**: quickifx下一项

**\<leader-lp\>**: locallist上一项

## 补全相关
**\<Ctrl-f/d\>**: 补全提示文档上下移动

**\<Ctrl-space/e\>**: 触发/停止补全

**\<CR\>**: 确认补全结果

**\<Tab\>/\<Shift-Tab\>**: 上下选择补全结果

## Java
**\<Alt-o\>**: 组织import

**\<leader-ev\>**: 提取变量

**\<leader-ec\>**: 提取常量

**\<leader-em\>**: 提取方法

## Telescope
**\<leader-ff\>**: 文件搜索

**\<leader-fg\>**: 字符串搜索

**\<leader-fb\>**: 缓冲区搜索

**\<leader-fh\>**: 帮助文档搜索


## Undotree相关
**\<F5\>**: 开关undotree

## Symbols_outline
**\<F6\>**: 开启关闭

**\<Esc\>/\<q\>**: 关闭

**\<CR\>**: 跳转符合位置

**\<o\>**: focus location

**\<Ctrl-space\>**: hover symbol

**\<K\>**: 预览

**\<r\>**: 重命名

**\<a\>**: code action
