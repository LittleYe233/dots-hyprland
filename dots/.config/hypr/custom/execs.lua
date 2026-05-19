hl.on("hyprland.start", function()
  -- Some distros (like NixOS) may not autostart fcitx5 after booting.
  hl.exec_cmd("pgrep fcitx5 || fcitx5 -d")
end)

