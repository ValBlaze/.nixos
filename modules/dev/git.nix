{
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    config = {
      user.email = "valblazeyt@gmail.com";
      user.name = "Val Blaze";
      pull.rebase = true;
    };
  };
  environment.systemPackages = with pkgs; [
    gh
  ];
}
