return {
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "hcl" },
    init = function()
      vim.g.terraform_fmt_on_save = 1
      vim.g.terraform_align = 1
    end,
  },
  {
    "juliosueiras/vim-terraform-completion",
    dependencies = {
      "hashivim/vim-terraform", 
    },
    ft = { "terraform", "hcl" }, 
    config = function()
      vim.g.terraform_completion_keys = 1
      vim.g.terraform_registry_module_completion = 0
    end,
  },
}

