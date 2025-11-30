{pkgs, ...}: {
  home-manager.users.valblaze = {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      font.package = pkgs.nerd-fonts.jetbrains-mono;
      font.name = "JetBrainsMono Mono";
      font.size = 12;

      settings = {
        background_opacity = 0.6;
        window_padding_width = 15;
        cursor_trail = 1;
        disable_ligatures = "never";
        copy_on_select = "yes";
        confirm_os_window_close = 0;
      };
    };
  };
}
