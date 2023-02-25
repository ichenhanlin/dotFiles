# dotFiles
个人用配置文件，包括neovim、zsh、alacritty和tmux等

## 安装
需要以下依赖：

- neovim >= 0.7.2
- zsh
- curl
- ripgrep
- golang >= 1.7
- python >= 3.7.2
### Neovim
#### **Ubuntu**
```
# 安装基础依赖
sudo apt-get install -y curl ripgrep build-essential
curl -O -L "https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage"
# 安装neovim
sudo chmod +x nvim.appimage
sudo mv ./nvim.appimage /usr/local/bin/nvim
# 安装golang1.8

# 安装python3.7

# 配置软链接
mkdir -p ${HOME}/.config
ln -s ${HOME}/dotFiles/nvim ${HOME}/.config/nvim
```

#### **Centos**
```
# 安装基础依赖
sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum install -y curl ripgrep util-linux-user
# 安装neovim
curl -O -L "https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage"
sudo chmod +x nvim.appimage
sudo mv ./nvim.appimage /usr/local/bin/nvim
# 安装golang1.8

# 安装python3.7

# 配置软链接
mkdir -p ${HOME}/.config
ln -s ${HOME}/dotFiles/nvim ${HOME}/.config/nvim
```

#### **MacOs**
```
brew install neovim ripgrep curl golang python3 python3-pip

# 配置软链接
mkdir -p ${HOME}/.config
ln -s ${HOME}/dotFiles/nvim ${HOME}/.config/nvim
```

### zsh
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

### alacritty
```
mkdir -p ${HOME}/.config
ln -s ${HOME}/dotFiles/alacritty ${HOME}/.config/alacritty
```

## neovim插件说明

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

## neovim快捷键说明

### 普通设置

**\<Alt-h/j/k/l\>**: 切换窗口

**:Sw**: 强制保存

### LSP相关
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

### 补全相关
**\<Ctrl-f/d\>**: 补全提示文档上下移动

**\<Ctrl-space/e\>**: 触发/停止补全

**\<CR\>**: 确认补全结果

**\<Tab\>/\<Shift-Tab\>**: 上下选择补全结果


### Undotree相关
**\<F5\>**: 开关undotree

### Symbols_outline
**\<F6\>**: 开启关闭

**\<Esc\>/\<q\>**: 关闭

**\<CR\>**: 跳转符合位置

**\<o\>**: focus location

**\<Ctrl-space\>**: hover symbol

**\<K\>**: 预览

**\<r\>**: 重命名

**\<a\>**: code action

