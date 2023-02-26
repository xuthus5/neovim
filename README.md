## neovim

一个neovim配置

### usage

安装插件管理工具

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

安装依赖

```bash
sudo dnf install fd-find ripgrep ShellCheck -y
go install github.com/jesseduffield/lazygit@latest
npm install eslint --global
npm install -g typescript typescript-language-server
npm install -g @volar/vue-language-server
```

### 记忆项

代码折叠

- zo - 在光标下打开折叠
- zc - 在光标下关闭折叠
- za - 切换光标下打开、关闭状态
- zr - 将所有折叠打开一层
- zm - 将所有折叠关闭一层
- zR - 打开全部折叠
- zM - 关闭全部折叠

