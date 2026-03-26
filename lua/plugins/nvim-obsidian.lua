return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter'},
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      heading = {
        atx = true,
        width = "block",
        render_modes = true
        -- backgrounds = {}
      },
      code = {
        language_pad = 20,
        left_pad = 2
      }
    },
  },
  {
   "IlyasYOY/obs.nvim",
   dependencies = {
       "nvim-lua/plenary.nvim",
   },
   config = function()
       local obs = require "obs"

       obs.setup {
           vault_home = "~/Notes",
           vault_name = "Notes",
           templates_home = "Notes/templates",
           templater = {
               home = "Notes/templates"
           },
           journal = {
               home = "/home/kaiyga/Notes/journal",
               template_name = "daily",
           },
       }

       vim.keymap.set("n", "<leader>nn", "<cmd>ObsNvimFollowLink<cr>")
       vim.keymap.set("n", "<leader>nr", "<cmd>ObsNvimRandomNote<cr>")
       vim.keymap.set("n", "<leader>nN", "<cmd>ObsNvimNewNote<cr>")
       vim.keymap.set("n", "<leader>ny", "<cmd>ObsNvimCopyObsidianLinkToNote<cr>")
       vim.keymap.set("n", "<leader>no", "<cmd>ObsNvimOpenInObsidian<cr>")
       vim.keymap.set("n", "<leader>nd", "<cmd>ObsNvimDailyNote<cr>")
       vim.keymap.set("n", "<leader>nw", "<cmd>ObsNvimWeeklyNote<cr>")
       vim.keymap.set("n", "<leader>nrn", "<cmd>ObsNvimRename<cr>")
       vim.keymap.set("n", "<leader>nT", "<cmd>ObsNvimTemplate<cr>")
       vim.keymap.set("n", "<leader>nM", "<cmd>ObsNvimMove<cr>")
       vim.keymap.set("n", "<leader>nb", "<cmd>ObsNvimBacklinks<cr>")

   end,
  },
}
