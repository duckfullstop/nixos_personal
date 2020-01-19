{ config, pkgs, lib, ... }:

let
  # TODO: Use readDir + map to get these automatically.
  dotfiles =
  [
    "bin"
  ];
  # make-dotfile = file: ".${file}" = {source = ./dotfiles + "/${file}";};
in
{
   # home-manager.users.duck.home.file = [] ++ (builtins.mapAttrs make-dotfile dotfiles);
   home-manager.users.duck.home.file =  {
     ".bin".source = ./dotfiles + "/bin";
     ".bin".executable = true;
   };
}
