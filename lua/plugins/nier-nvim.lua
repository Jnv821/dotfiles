return {
  {
  "rktjmp/lush.nvim", 
  },
  { dir = os.getenv("NVIM_THEMES"), 
   config = function()
   vim.cmd("colorscheme nier_nvim")
   end
  }
}
