# duck. nixos User Environment Configuration.

This repository contains a declarative configuration of my preferred user environment.

## Usage

If you'd like to give me this environment on your box, create a user with an incantation like this:

```
let
  home-duck = builtins.fetchGit {
    url = "https://github.com/luaduck/nixos_personal.git";
    ref = "master";
  };
in
{
    imports = [
      "${home-manager}/nixos"
    ];
}
{
  # Customise configuration to your taste.
  users.users.duck =
  {
    createHome = true;
    description = "duck.";
    extraGroups = [ "libvirtd" "docker" "audio" "video" ];
    group = "users";
    isNormalUser = true;
  };

  imports =
  [
    # Use base for servers / terminals, ws for workstations.
    "${home-duck}/base.nix"
  ];
}
```

Note: **I STRONGLY RECOMMEND HAVING `services.openssh.passwordAuthentication` SET TO `false`**;

`nixos-rebuild switch` should then import this environment to your system.