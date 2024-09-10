return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim'
  	},
  config = function()
  local file_explorer_state = true;
    function toggle_file_explorer()
      if file_explorer_state then
        vim.cmd(':Neotree filesystem reveal left')
      else
        vim.cmd(':Neotree close')
      end
      file_explorer_state = not file_explorer_state
    end  
  vim.api.nvim_set_keymap('n', '<A-e>', ':lua toggle_file_explorer()<CR>', {noremap = true, silent = true})
  end
}
