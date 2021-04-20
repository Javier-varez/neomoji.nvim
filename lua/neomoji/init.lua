
local M = {}

local get_cursor_position = function(buffer)
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row = cursor[1] - 1
    local column = cursor[2]

    -- We want to get the next position
    local current_line = vim.api.nvim_buf_get_lines(buffer, row, row + 1, true)
    if #current_line[1] > 0 then
        column = column + 1;
    end

    return {
        row = row,
        column = column
    }
end

M.find = function()
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local sorters = require('telescope.sorters')
    local action_set = require('telescope.actions.set')
    local action_state = require('telescope.actions.state')
    local emojis = require('neomoji.emoji')

    local buffer = vim.api.nvim_get_current_buf()
    local cursor = get_cursor_position()

    pickers.new(nil, {
        prompt_title = 'Search emojis',
        finder = finders.new_table {
            results = emojis,
            entry_maker = function(entry)
                return {
                    value = entry.symbol,
                    ordinal = entry.keywords[1],
                    display = entry.symbol
                }
            end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function()
            action_set.select:replace(function(prompt_bufnr)
                local emoji = action_state.get_selected_entry()
                vim.api.nvim_buf_set_text(buffer, cursor.row, cursor.column,
                    cursor.row, cursor.column, { emoji.value })
                require('telescope.actions').close(prompt_bufnr)
            end)
            return true
        end
    }):find()
end

return M

