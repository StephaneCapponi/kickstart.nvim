-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

-- Default terminal
config.default_prog = { 'C:/Program Files/Git/bin/bash.exe' }
config.default_cwd = 'C:/git-repos/'

-- Font
config.font = wezterm.font 'JetBrains Mono'

-- Maximize all windows at startup
wezterm.on('gui-attached', function(_)
  -- maximize all displayed windows on startup
  local workspace = mux.get_active_workspace()
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then
      window:gui_window():maximize()
    end
  end
end)

-- Configure mulitple workspace
wezterm.on('gui-startup', function(cmd)
  -- allow `wezterm start -- something` to affect what we spawn
  -- in our initial window
  local args = {}
  if cmd then
    args = cmd.args
  end

  -- Set a workspace for coding on a current project
  -- Top pane is for the editor, bottom pane is for the build tool
  local project_dir = args.cwd
  local tab, build_pane, window = mux.spawn_window {
    workspace = 'coding',
    cwd = project_dir,
    args = args,
  }
  local editor_pane = build_pane:split {
    direction = 'Top',
    size = 0.7,
    cwd = project_dir,
  }
  -- We want to startup in the coding workspace
  mux.set_active_workspace 'coding'
end)

-- and finally, return the configuration to wezterm
return config
