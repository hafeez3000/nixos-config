{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
##  environment.pathsToLink = [ "/share/fish" ];
  environment.pathsToLink = [ "/share/zsh" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
##  programs.fish.enable = true;
  programs.zsh.enable = true;

  users.users.mitchellh = {
    isNormalUser = true;
    home = "/home/mitchellh";
    extraGroups = [ "docker" "wheel" ];
#    shell = pkgs.fish;
    shell = pkgs.zsh;
    hashedPassword = "$6$XiDgnxqJleRuiwr2$Qgs2M4EbgoDDXclkAnGf8tPr76SVTO7WdUlGjr8vsEcijHm26EaFsnn1IFFwOHKWq82w4PqEi.dAI5rzrBjPq0";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGbTIKIPtrymhvtTvqbU07/e7gyFJqNS4S0xlfrZLOaY mitchellh"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}
