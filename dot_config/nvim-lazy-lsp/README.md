# nvim-lazy-lsp

_lazy.nvim configured, lsp-powered, **Neovim**_

This is a complete yet easily understandable, 100% Lua-based, Neovim
configuration for code and general purpose editing. It's my daily driver and is
configured for:

- Go
- HTML/CSS/JSON and related (VSCode LSPs, Emmet snippet support)
- Markdown (Marksman)
- Javascript/Typescript (Rome)
- Lua/nvim

```
                 d8b
                 Y8P

8888b.  888  888 888 88888b.d88b.
88 "88b 888  888 888 888 "888 "88b
88  888 Y88  88P 888 888  888  888
88  888  Y8bd8P  888 888  888  888
88  888   Y88P   888 888  888  888

        Bootstrapping nvim

  lazy.nvim installing plugins...
```

Plugins are defined, lazy-loaded and configured via
[lazy.nvim](https://github.com/folke/lazy.nvim). This nvim config uses
lazy.nvim more for the configuration approach than for lazy-loading.

See [core/lua/plugins/lspconfig.lua](/solutionroute/nvim-lazy-lsp/blob/main/lua/core/plugins/lspconfig.lua) for
how languague servers, completions and snippets are configured.

To add or modify LSPs see
[nvim-lspconfig's documentation](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

## Installation

*This Neovim configuration should work on both nvim stable and nightly.*

See [Related Software](#related-software) for notes on Go and Node.

1. Backup (or rename) any existing `~/.config/nvim`.
   ```
   # rename so you can symlink to your old config if needed
   cd $HOME/.config
   # rename existing to avoid clobbering or old packer installs
   mv -n nvim nvim-YourRepoName

   # clone and link nvim to the repo so if needed you can switch simply 
   # by re-linking to your old config

   git clone https://github.com/solutionroute/nvim-lazy-lsp.git 
   ln -sv nvim-lazy-lsp nvim
   ```
1. If the bootstrap process runs into any issues, run within nvim:
   ```
   :checkhealth lazy
   ```
1. Install needed language servers. For my configuration you can run [install_lsps.sh](/solutionroute/nvim-lazy-lsp/blob/main/install_lsps.sh)

## Customization

If for some reason you are tracking this repo and wish to *add* other plugins,
follow the pattern in lua/core/plugins/... and drop user-someplugin.lua in
there. Done.

If you are making larger modifications, you should either fork the repo or
borrow whatever is helpful and have at it. It's getting easier and easier to
configure nvim to do powerful things.

## Leader & Menus

- **Leader**: The `<Leader>` key default is `<Space>`.

- **Common Mappings**: which-key also exposes menus in normal mode for common
  movement-related mappings such as **c** (cut/change), **d** (delete), **y**
  (yank), **g** (go/movement), **v** (visual), **z** (folds, spelling). In
  normal mode, press these keys (once) to see more. Multi-key mappings like
  `<C-w>` will also display a menu after timeout.

## Screenshots

Showing the default Nordfox theme (modified with a slightly darker bg color),
from the [EdenEast/nightfox.nvim theme](https://github.com/EdenEast/nightfox.nvim) pack:

Signature while typing, go to definition, tree explorer
![fn sigs and more](https://raw.githubusercontent.com/solutionroute/nvim/main/doc/fnsig-tree-fndef.png)

Code Completion
![code-completion](https://raw.githubusercontent.com/solutionroute/nvim/main/doc/code-completion.png)

Which-key menus (c cut/change key)
![which-key menus](https://raw.githubusercontent.com/solutionroute/nvim/main/doc/whichkey-c-menu.png)

## File Layout

Reading `lua/core/init.lua` and `lua/core/plugins/...` will show you how how
this straightforward config hangs together.

```
.
├── init.lua
├── lazy-lock.json
└── lua
    └── core
        ├── autocommands.lua
        ├── init.lua
        ├── mapping.lua
        ├── options.lua
        └── plugins
            ├── colorscheme.lua
            ├── comment.lua
            ├── dev.lua
            ├── init.lua
            ├── lspconfig.lua
            ├── treesitter.lua
            └── ui.lua
```

## Related Software

**Nodejs**: Some language servers rely on `nodejs`, so you *may*
need to install Node and a package manager on your machine.

### Go

Visit <https://go.dev/dl/>.

### Nodejs

Many LSPs are available through the nodejs package system. If you used Mason
before, and have chosen to drop it, be aware it had its own location for LSP
executables, not `~/.npm-global/bin`. You'll need to install LSP executables to
an appropriate place that is located in your `$PATH`.

Consider configuring `nodejs` in a way that doesn't require root access to
add packages.

1. Include a variable in your `.bashrc` or relevant shell config file:

   ```
    # nodejs - global packages per user, avoids need for sudo in: npm i -g <pkgname>
    # https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
    export NPM_CONFIG_PREFIX=~/.npm-global
   ```

1. Be sure your path to npm's bin directory is in your path. Ddefault:

   ```
    $HOME/.npm-global/bin
   ```

1. Start a new terminal session to reflect the change before installing
   anything with `npm -g`.

### Treesitter CLI (if needed)

After installing and configuring `nodejs`, if a desired parser
requires the treesitter cli:

```
npm install -g tree-sitter
```
