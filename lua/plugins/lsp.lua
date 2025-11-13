return {
  {
    -- Core LSP client integration for Neovim
    'neovim/nvim-lspconfig',

    dependencies = {
      -- Tool manager (servers/formatters/debuggers live under stdpath)
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Status UI for LSP progress (non-blocking)
      { 'j-hui/fidget.nvim', opts = {} },

      -- Completion plugin; we only need its advertised LSP capabilities
      'saghen/blink.cmp',
    },

    config = function()
      ---------------------------------------------------------------------------
      -- 1) Diagnostics: severity sorting, visuals, floating borders
      ---------------------------------------------------------------------------
      vim.diagnostic.config({
        severity_sort = true,
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN ] = '󰀪 ',
            [vim.diagnostic.severity.INFO ] = '󰋽 ',
            [vim.diagnostic.severity.HINT ] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(d) return d.message end,
        },
        float = { border = 'rounded', source = 'if_many' },
      })

      -- Optional: rounded borders for hover/signature as well
      local with_border = function(handler)
        return vim.lsp.with(handler, { border = 'rounded' })
      end
      vim.lsp.handlers['textDocument/hover']          = with_border(vim.lsp.handlers.hover)
      vim.lsp.handlers['textDocument/signatureHelp']  = with_border(vim.lsp.handlers.signature_help)

      ---------------------------------------------------------------------------
      -- 2) Capabilities: extend client abilities via blink.cmp
      ---------------------------------------------------------------------------
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      ---------------------------------------------------------------------------
      -- 3) Servers to enable (add/remove freely)
      --    Keys you may override per server: cmd, filetypes, settings, capabilities, on_attach
      ---------------------------------------------------------------------------
      local servers = {
        -- Python
        pyright = {},
        ruff = {},

        -- Rust
        rust_analyzer = {},

        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              -- diagnostics = { disable = { 'missing-fields' } }, -- example toggle
            },
          },
        },
      }

      ---------------------------------------------------------------------------
      -- 4) Ensure required tools are installed via Mason Tool Installer
      ---------------------------------------------------------------------------
      local ensure = vim.tbl_keys(servers)
      vim.list_extend(ensure, {
        'stylua',  -- Lua formatter
        'ruff',    -- Python linter/formatter
      })
      require('mason-tool-installer').setup({ ensure_installed = ensure })

      ---------------------------------------------------------------------------
      -- 5) Wire servers via mason-lspconfig; inject capabilities + on_attach
      ---------------------------------------------------------------------------
      local on_attach = require('lsp.on_attach').on_attach

      require('mason-lspconfig').setup({
        ensure_installed = {},            -- We rely on mason-tool-installer above
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- Merge capabilities (server-specific can override defaults if provided)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            -- Single source of truth for keymaps, per-buffer
            server.on_attach = on_attach
            require('lspconfig')[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
