{
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    # config = {
    #   pull.rebase = true;
    #   user.email = "valblazeyt@gmail.com";
    #   user.name = "valblaze";
    # };
  };

  environment.systemPackages = with pkgs; [
    gh
  ];
}
