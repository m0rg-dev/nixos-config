local wezterm = require 'wezterm'

local scheme = wezterm.get_builtin_color_schemes()["Builtin Solarized Dark"]
-- scheme.brights[1] = "#073642"
-- scheme.ansi[1] = "#002b36"
scheme.indexed = {}

local opts = {
  font = wezterm.font("Iosevka"),
  color_schemes = {
    ["Solarized Dark"] = scheme
  },
  color_scheme = "Solarized Dark",
  bold_brightens_ansi_colors = false,
  hide_tab_bar_if_only_one_tab = true,
}

if os.getenv("OS") == "Windows_NT" then
	opts.default_prog = {"wsl.exe", "-d", "alpine", "--cd", "~"}
end

return opts
