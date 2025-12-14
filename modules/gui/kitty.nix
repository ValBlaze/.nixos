{ config, lib, ... }: {
  hjem.users.valblaze.rum = {
    programs.kitty = {
      enable = true;
      integrations.zsh.enable = true;
      settings = {
        font_family = "JetBrainsMono Nerd Font Mono";
        font_size = 12;
        enable_audio_bell = false;
        window_padding_width = 15;
        background_opacity = 0.6;
        hide_window_decorations = true;
        cursor_trail = 1;
        disable_ligatures = "never";
        copy_on_select = true;
        confirm_os_window_close = 0;
        include = "current-theme.conf";
      };
    };
  };
}
