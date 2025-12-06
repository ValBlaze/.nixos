{ inputs, lib, pkgs, self', ... }: {
  hjem.users.valblaze = {
    files.".config/nvim".source = "/home/valblaze/.nixos/modules/cli/nvim";
  };

  programs.mnw = {
    enable = true;
    neovim = pkgs.neovim-unwrapped;

    initLua = ''
      require('config')
      require('lz.n').load('lazy')
    '';

    plugins = {
      start = with pkgs.vimPlugins; [
        lz-n
        plenary-nvim
      ];

      opt = with pkgs.vimPlugins; [
        telescope-nvim
      ];

      dev.config = {
        pure = ./.;
        impure = "/home/valblaze/.nixos/modules/cli/nvim";
      };
    };
  };
}

