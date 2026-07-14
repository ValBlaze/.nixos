{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (discord.override {
      withEquicord = true;
    })
    element-desktop
  ];
}
