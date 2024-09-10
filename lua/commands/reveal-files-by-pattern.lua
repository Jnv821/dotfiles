-- ~/.config/nvim/lua/commands/toggle_visibility.lua

local visibility_state = {}

function ToggleFileVisibility(extension)
    extension = extension:gsub("^%.", "")
    if visibility_state[extension] == nil then
        visibility_state[extension] = true
    end
    visibility_state[extension] = not visibility_state[extension]

    local hide_pattern = visibility_state[extension] and {} or { '*.' .. extension }
    require('neo-tree').setup({
        filesystem = {
            filtered_items = {
                hide_by_pattern = hide_pattern
            }
        }
    })
    vim.cmd('Neotree close')
    vim.cmd('Neotree filesystem reveal left')
    -- Removing the Neotree refresh command
    -- vim.cmd('Neotree refresh')  -- Comment or remove this line
end

vim.api.nvim_create_user_command('Reveal', function(opts)
    ToggleFileVisibility(opts.args)
end, { nargs = 1 })

