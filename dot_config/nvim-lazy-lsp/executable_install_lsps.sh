#!/bin/bash
# installs Language Server Protocol servers and related software for nvim

# go 
# You'll need Go https://go.dev/dl/
#
echo "Installing the Go bare minimum: gopls & gofumpt"
go install golang.org/x/tools/gopls@latest
go install mvdan.cc/gofumpt@latest
echo "If using crispgm/nvim-go, run one or the other as needed within nvim:"
echo ":GoInstallBinaries"
echo ":GoUpdateBinaries"

# npm based
# https://github.com/aca/emmet-ls
echo "Installing emmet-ls"
npm install -g emmet-ls


# https://github.com/bash-lsp/bash-language-server
echo "Installing bash-ls"
npm install -g bash-language-server

# https://github.com/hrsh7th/vscode-langservers-extracted
# for cssls, html, json, eslint 
echo "Installing vscode-langservers-extracted"
npm install -g vscode-langservers-extracted

# https://github.com/joe-re/sql-language-server
npm install -g sql-language-server

# https://rome.tools/
# A javascript and typescript formatter and linter; json, html. markdown, css coming in 2023
echo "Installing rome"
npm install -g rome

# others
# https://github.com/sumneko/lua-language-server/releases
# I'm on Void Linux so:
echo "Installing lua-language-server (Void Linux Packages)"
xi lua-language-server

# https://github.com/artempyanykh/marksman
wget https://github.com/artempyanykh/marksman/releases/download/2022-12-28/marksman-linux -O $HOME/bin/marksman
chmod +x $HOME/bin/marksman
