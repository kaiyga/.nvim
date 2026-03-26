return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end
  },
  {
  'tanvirtin/vgit.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  -- Lazy loading on 'VimEnter' event is necessary.
  event = 'VimEnter',
  config = function() 
    require('vgit').setup({
      keymaps = {
      ['n ]h'] = function() require('vgit').hunk_down() end,
      ['n [h'] = function() require('vgit').hunk_up() end,
      ['n <leader>gp'] = function() require('vgit').buffer_hunk_preview() end,
      ['n <leader>gs'] = function() require('vgit').buffer_hunk_stage() end,
      ['n <leader>gr'] = function() require('vgit').buffer_hunk_reset() end,
      ['n <leader>gd'] = function() require('vgit').buffer_diff_preview() end,
      ['n <leader>gh'] = function() require('vgit').buffer_history_preview() end,
      ['n <leader>gb'] = function() require('vgit').buffer_blame_preview() end,
      ['n <leader>gD'] = function() require('vgit').project_diff_preview() end,
      ['n <leader>gL'] = function() require('vgit').project_logs_preview() end,
      ['n <leader>gS'] = function() require('vgit').project_stash_preview() end,
      }
    })
    end,
  }
}
