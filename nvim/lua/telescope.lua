local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
telescope.setup{
  defaults = {
      prompt_prefix = "$",
      mappings = {
          i = {
            ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
          }
      }
  }
}
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

local mappings = {
}
mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({height=10, previewer=false})
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
return mappings

