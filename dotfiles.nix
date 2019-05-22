{ config, pkgs, lib, ... }:

let
  # TODO: Use readDir + map to get these automatically.
  dotfiles =
  [
    #"config/i3"
    "zsh_custom"
    "zshrc"
    "taskrc"
    # "gitconfig"
    # "gitignore"
    "mpv/mpv.conf"
    "bin"
  ];
  # make-dotfile = file: ".${file}" = {source = ./dotfiles + "/${file}";};
in
{
   # home-manager.users.duck.home.file = [] ++ (builtins.mapAttrs make-dotfile dotfiles);
   home-manager.users.duck.home.file =  {
     ".zsh_custom".source = ./dotfiles + "/zsh_custom";
     ".zshrc".source = ./dotfiles + "/zshrc";
     ".taskrc".source = ./dotfiles + "/taskrc";
     ".mpv/mpv.conf".source = ./dotfiles + "/mpv/mpv.conf";
     ".bin".source = ./dotfiles + "/bin";
     ".bin".executable = true;
   };
}
