{
  ...
}:

{
  programs.git = {
    enable = true;
    config = {
      pull.rebase = true;
    };
  };
}
