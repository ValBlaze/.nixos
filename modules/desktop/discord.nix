{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    vencord
    (discord.override {
      withVencord = true;
    })
  ];
}
