return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
        "emmet-ls",
        "gofumpt",
        "golangci-lint",
        "gopls",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "python-lsp-server",
        "pyright",
        "rome",
        "shellcheck",
        "shfmt",
        "stylua",
        "sql-formatter",
        "sqlls",
        -- "tailwindcss-language-server", rarely needed
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        -- tailwindcss = {},
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.gofumpt,
          nls.builtins.diagnostics.golangci_lint,
          nls.builtins.formatting.sql_formatter,
          nls.builtins.formatting.stylua,
        },
      }
    end,
  },

  -- minimalistic go plugin for calling certain tools like gomodifytags
  -- thankfully, no LSP interaction, as we do all that elsewhere automatically
  {
    "olexsmir/gopher.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- I dislike the animation
  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },
  -- Feb 2023 - after disabling mini.indentscope, noted is only showing up in lua, not in my go files
  --  ts issue?
  { "lukas-reineke/indent-blankline.nvim", opts = { show_current_context = true } },
}
