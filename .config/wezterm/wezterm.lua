local wezterm = require 'wezterm'


local function basename(input)
    return string.gsub(input, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab)
    local pane = tab.active_pane;
    local title = basename(pane.foreground_process_name);

    return {
        {Text=" " .. title .. " "},
    };
end);

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local title = pane.foreground_process_name
  return {
    {Text=" " .. title .. " "},
  }
end)

return {
  font = wezterm.font_with_fallback {'IBM Plex Mono',
                                    "Noto Color Emoji",
                                    "Symbols Nerd Font"
                                  },
  font_size = 12,
  color_scheme = "Catppuccin Mocha",
  hide_tab_bar_if_only_one_tab = true,
}

