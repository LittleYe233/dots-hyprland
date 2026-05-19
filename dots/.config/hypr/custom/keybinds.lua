hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit user keybinds"} )

hl.bind("SUPER+Minus", hl.dsp.focus({workspace = 100}))
hl.bind("SUPER+Equal", hl.dsp.focus({workspace = 1}))
