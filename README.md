## first install

### Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

### Windows
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim 


## dependencies

```shell
sudo dnf install fd-find ripgrep ShellCheck luarocks -y
go install github.com/jesseduffield/lazygit@latest
sudo npm install -g typescript typescript-language-server
sudo npm install -g @volar/vue-language-server
sudo npm install -g eslint_d
go install github.com/yoheimuta/protolint/cmd/protolint@latest
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
go install mvdan.cc/gofumpt@latest
```

