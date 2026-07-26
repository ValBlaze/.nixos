{
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    config = {
      pull.rebase = true;
      user.email = "valblazeyt@gmail.com";
      user.name = "valblaze";
    };
  };

  home-manager.users.valblaze = {
    # Use home-manager for its gh credential helper
    programs.gh.enable = true;
  };
}
