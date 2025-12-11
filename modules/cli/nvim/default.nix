{ inputs, lib, pkgs, self', ... }: {

  programs.mnw = {
    enable = true;
    neovim = pkgs.neovim-unwrapped;
    extraBinPath = [];
    # finalPackage = package

    initLua = ''
      require('config')
      require('lz.n').load('lazy')
    '';

    plugins = {
      start = with pkgs.vimPlugins; [
        lz-n
        plenary-nvim # dep of telescope
        oil-nvim
      ];

      opt = with pkgs.vimPlugins; [
        telescope-nvim
      ];

      dev.config = {
        pure = ./.;
        impure = "/home/valblaze/.nixos/modules/cli/nvim/lua/config";
      };
    };
  };
}

