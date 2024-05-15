return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return (vim.endswith(name, '.pyc') or name == '__pycache__')
        end,
      },
    }
  end,
}
