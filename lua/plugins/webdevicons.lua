return {
  'nvim-tree/nvim-web-devicons',
  config = function()
  -- Define your desired color settings
  local icons = require'nvim-web-devicons'.get_icons() 
  local color = "#585241"
  local pr = function(icons)
    for k, icon in pairs(icons) do 
        icon.color = color  
     end
  end
  pr(icons)

  require'nvim-web-devicons'.refresh()
  end
  
}
