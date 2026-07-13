{
  ...
}:

{
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt6ct";

    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    EDITOR = "nvim";
    VISUAL = "nvim";

    FZF_DEFAULT_OPTS = " \\
      --color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \\
      --color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \\
      --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \\
      --color=selected-bg:#494D64 \\
      --color=border:#6E738D,label:#CAD3F5";

    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CACHE_HOME = "$HOME/.cache";

    GNUPGHOME = "$XDG_DATA_HOME/gnupg";
    WINEPREFIX = "$XDG_DATA_HOME/wine";
    CARGO_HOME = "$XDG_DATA_HOME/cargo";
    RENPY_PATH_TO_SAVES = "$XDG_DATA_HOME";
  };
}
