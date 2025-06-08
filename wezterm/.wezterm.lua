local wezterm = require 'wezterm'
local resurrect = wezterm.plugin.require "https://github.com/MLFlexer/resurrect.wezterm"

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

local act = wezterm.action

-- カラースキームの設定
config.color_scheme = 'ayu'

-- 背景透過
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.window_decorations = "TITLE"
config.show_new_tab_button_in_tab_bar = false
config.initial_rows = 48
config.initial_cols = 150

-- pane
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.2,
  hue = 1
}

config.use_ime = true

-- resurrect
wezterm.on("gui-startup", resurrect.state_manager.resurrect_on_gui_startup)
resurrect.state_manager.periodic_save({
	interval_seconds = 300,
	save_tabs = true,
	save_windows = true,
	save_workspaces = true,
})

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
      action = act.ToggleFullScreen
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
}
-- full screen
-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
-- end)

-- shourtcut
-- local act = wezterm.action
-- config.keys = { -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
-- {
--     key = ' ',
--     mods = 'META',
--     action = act.ToggleFullScreen
-- }}

return config
