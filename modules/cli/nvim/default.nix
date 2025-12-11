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
      dev = {
        start = with pkgs.vimPlugins; [
          lz-n
          plenary-nvim # telescope dependency
          oil-nvim
        ];

        opt = with pkgs.vimPlugins; [
          telescope-nvim
        ];
      }

      config = {
        pure = ./.;
        impure = "/home/valblaze/.nixos/modules/cli/nvim";
      };
    };
  };
}

