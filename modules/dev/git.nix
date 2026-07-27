{
  pkgs,
  ...
}:

{
  home-manager.users.valblaze = {
    programs.git = {
      enable = true;
      settings = {
        user.email = "valblazeyt@gmail.com";
        user.name = "Val Blaze";
        pull.rebase = true;
      };
    };
    programs.gh.enable = true;
  };
}
