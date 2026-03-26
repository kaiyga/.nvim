local linters = {
  'gopls',
  'biome',
  'lua_ls',
  'pyright',
  'solargraph',
  "jsonls",
  "cssls",
  'html',
  'terraformls',
  'latexindent',
  'ltex-ls',
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

      local lspconfig = vim.lsp.config
      -- Install linters in list
      for _, s in ipairs(linters) do
        local server = lspconfig[s]
        if server and server.setup then
          server.setup {
            capabilities = capabilities,
          }
        end
      end

     vim.lsp.enable('hls')
     vim.lsp.enable('tinymist')
     vim.lsp.enable('biome')

     vim.lsp.config("pyright", {
        settings = {
          python = {
            analisys = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'openFilesOnly',
              ignore = {"reportOptionalMemberAccess"},
      }}}})
     vim.lsp.enable('pyright')


     vim.lsp.config['terraformls'] = {
       cmd = { "terraform-ls", "serve" },
       filetypes = { "terraform", "hcl", "tf" },
       root_patterns = { ".terraform", ".git", ".terraform.lock.hcl", "main.tf" },
      }
      vim.lsp.enable('terraformls')

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ge", vim.diagnostic.setqflist, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cp", vim.lsp.buf.format, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Smart Rename' })
    end,
  },
}
