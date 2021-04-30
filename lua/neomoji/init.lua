
local M = {}

M.find = function()
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local sorters = require('telescope.sorters')
    local action_set = require('telescope.actions.set')
    local emojis = require('neomoji.emoji')

    pickers.new(nil, {
        prompt_title = 'Search emojis',
        finder = finders.new_table {
            results = emojis,
            entry_maker = function(entry)
                return {
                    value = { entry.symbol },
                    ordinal = entry.keywords[1],
                    display = entry.symbol
                }
            end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function()
            action_set.select:replace(function(prompt_bufnr)
                require('telescope.actions').insert_symbol(prompt_bufnr)
            end)
            return true
        end
    }):find()
end

return M
