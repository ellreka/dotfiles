if not status --is-interactive
  exit 0
end

function abbr_set --description 'set abbreviations'
  echo "setting fish abbreviations"
  # first erase all existing abbreviations
  for ab in (abbr --list)
    abbr --erase "$ab"
  end

  # then source current abbreviations
  source "$HOME/.config/fish/abbreviations.fish"
  set -U fish_abbreviations_set true
end

function colors_set --description 'set colors'
  echo "setting fish colors"
  # Colorscheme: ayu Dark
  set -U fish_color_normal B3B1AD
  set -U fish_color_command 39BAE6
  set -U fish_color_quote C2D94C
  set -U fish_color_redirection FFEE99
  set -U fish_color_end F29668
  set -U fish_color_error FF3333
  set -U fish_color_param B3B1AD
  set -U fish_color_comment 626A73
  set -U fish_color_match F07178
  set -U fish_color_selection --background=E6B450
  set -U fish_color_search_match --background=E6B450
  set -U fish_color_history_current --bold
  set -U fish_color_operator E6B450
  set -U fish_color_escape 95E6CB
  set -U fish_color_cwd 59C2FF
  set -U fish_color_cwd_root red
  set -U fish_color_valid_path --underline
  set -U fish_color_autosuggestion 99a9cc
  set -U fish_color_user brgreen
  set -U fish_color_host normal
  set -U fish_color_cancel --reverse
  set -U fish_pager_color_prefix normal --bold --underline
  set -U fish_pager_color_progress brwhite --background=cyan
  set -U fish_pager_color_completion normal
  set -U fish_pager_color_description B3A06D
  set -U fish_pager_color_selected_background --background=E6B450
  set -U fish_color_host_remote
  set -U fish_pager_color_selected_description
  set -U fish_pager_color_background
  set -U fish_color_option
  set -U fish_color_keyword
  set -U fish_pager_color_selected_prefix
  set -U fish_pager_color_secondary_description
  set -U fish_pager_color_secondary_prefix
  set -U fish_pager_color_selected_completion
  set -U fish_pager_color_secondary_completion
  set -U fish_pager_color_secondary_background
end

colors_set
abbr_set
fish_vi_key_bindings

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pyenv
pyenv init - | source

# Added by `rbenv init` on 2025年 1月15日 水曜日 14時26分27秒 JST
status --is-interactive; and rbenv init - --no-rehash fish | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/s.tanigome/.lmstudio/bin
# End of LM Studio CLI section

alias claude="/Users/s.tanigome/.claude/local/claude"
