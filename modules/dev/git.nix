{
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    config = {
      pull.rebase = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gh
  ];
}
