local linters = {
  'gopls',
  'lua_ls',
  'pyright',
  'solargraph',
  "jsonls",
  "cssls",
  'html',
}

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function() require("mason").setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require "lspconfig"
      -- Install linters in list
      for _, s in ipairs(linters) do
        local server = lspconfig[s]
        if server and server.setup then
          server.setup {
            capabilities = capabilities,
          }
        end
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cp", vim.lsp.buf.format, {})
    end,
  },
}

