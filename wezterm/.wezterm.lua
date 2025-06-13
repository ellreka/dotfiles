local wezterm = require 'wezterm'
local resurrect = wezterm.plugin.require "https://github.com/MLFlexer/resurrect.wezterm"

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local act = wezterm.action

-- color scheme
config.color_scheme = 'Ayu Dark (Gogh)'

config.font = wezterm.font_with_fallback({
  { family = 'UDEV Gothic 35', weight = 'Regular' },
})

config.font_size = 13
config.line_height = 1.2

-- ligatures
config.harfbuzz_features = { "calt=0" }

-- 背景透過
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
-- config.window_decorations = "TITLE"
-- config.show_new_tab_button_in_tab_bar = false
-- config.initial_rows = 48
-- config.initial_cols = 150

-- pane
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.2,
  hue = 1
}

config.use_ime = true

-- resurrect
resurrect.state_manager.periodic_save({
  interval_seconds = 300,
  save_tabs = true,
  save_windows = true,
  save_workspaces = true,
})

wezterm.on("gui-startup", function()
  resurrect.state_manager.resurrect_on_gui_startup()

  local _tab, _pane, window = wezterm.mux.spawn_window({})
  window:gui_window():set_position(0, 0)
  window:gui_window():maximize()
end)

-- leader キー
config.leader = { key = "b", mods = "ALT", timeout_milliseconds = 1000 }

config.keys = {
  {
    mods = "LEADER",
    key = "s",
    action = act.ShowLauncherArgs { flags = "WORKSPACES", title = "Select workspace" }
  },
  {
    key = "d",
    mods = "CMD",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" }
  },
  {
    key = "d",
    mods = "SHIFT|CMD",
    action = act.SplitVertical { domain = "CurrentPaneDomain" }
  },
  {
    key = "w",
    mods = "CMD",
    action = act.CloseCurrentPane { confirm = true }
  },
  {
    key = "]",
    mods = "CMD",
    action = act.ActivatePaneDirection "Next"
  },
  {
    key = "[",
    mods = "CMD",
    action = act.ActivatePaneDirection "Prev"
  },
  {
    key = 'n',
    mods = 'ALT',
    action = wezterm.action_callback(function(window, _)
      local before = window:get_dimensions()
      window:maximize()
      local after = window:get_dimensions()

      if (before.pixel_width == after.pixel_width) and (before.pixel_height == after.pixel_height) then
        window:restore()
      end
    end)
  },
  {
    key = 'p',
    mods = 'CMD|SHIFT',
    action = act.ActivateCommandPalette
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = act.TogglePaneZoomState
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = act.AdjustPaneSize {
      'Left',
      5
    }
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = act.AdjustPaneSize {
      'Right',
      5
    }
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = act.SpawnCommandInNewTab { cwd = wezterm.home_dir }
  },
  {
    key = "r",
    mods = "LEADER",
    action = act.ReloadConfiguration
  }
}

return config
